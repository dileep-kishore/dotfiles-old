#!/usr/bin/env python3
"""
    Functionality:
    1. Add new todoist tasks to a capture table in coda.io
    2. Sync edits in task details between todoist and coda.io
    3. Handle connection timeouts and errors appropriately
"""

import os
from typing import List, Tuple

from codaio import Coda, Document, Table, Row, Cell, Column
from dotenv import load_dotenv
import pendulum
import todoist
from todoist.models import Item


load_dotenv()

TODOIST_COLS = [
    "id",
    "content",
    "labels",
    "priority",
    "project_id",
    "due date",
    "parent_id",
    "date_added",
]
CODA_COLS = [
    "Task ID",
    "Task",
    "Labels",
    "Priority",
    "Project",
    "Due date",
    "Dependency",
    "Modified on",
]

# Coda api
# NOTE: This package doesn't support v1.0 of the api yet
CODA_API_KEY = os.getenv("CODA_API_KEY")
CODA_API_ENDPOINT = os.getenv("CODA_API_ENDPOINT")
CODA_API = Coda(CODA_API_KEY, CODA_API_ENDPOINT)

# Todoist api
TODOIST_API_KEY = os.getenv("TODOIST_API_KEY")
TODOIST_API = todoist.TodoistAPI(TODOIST_API_KEY)
TODOIST_API.sync()


def get_todoist_tasks() -> dict:
    """ Get a dictionary containing `task id` -> `Item` object """
    task_dict = {item["id"]: item for item in TODOIST_API.items.all()}
    return task_dict


def get_todoist_labels() -> dict:
    """ Get a dictionary containing `label id` -> `Label` object """
    label_dict = {label["id"]: label for label in TODOIST_API.labels.all()}
    return label_dict


def get_todoist_projects() -> dict:
    """ Get a dictionary containing `project id` -> `Project` object """
    project_dict = {project["id"]: project for project in TODOIST_API.projects.all()}
    return project_dict


# FIXME: Each Cell needs a Column object not a column string (coda_col)
def todoist_to_coda_converter(
    todoist_item: Item, coda_columns: List[Column]
) -> List[Cell]:
    """
        Convert todoist `Item` object into a list of Coda `Cell` objects

        Parameters
        ----------
        todoist_item : Item
            The todoist `Item` object to be converted
        coda_columns : List[Column]
            The list of coda `Column` objects

        Returns
        -------
        List[Cell]
            The list of coda cells that will form the new row in the coda table
    """
    coda_cells: List[Cell] = []
    coda_column_dict = {col.name: col for col in coda_columns}
    for todoist_col, coda_col in zip(TODOIST_COLS, CODA_COLS):
        if todoist_col == "due date":
            if todoist_item.data["due"]:
                value = todoist_item.data["due"]["date"]
            else:
                value = ""
        elif todoist_col == "labels":
            value = []
            label_dict = get_todoist_labels()
            for label_id in todoist_item.data["labels"]:
                value.append(label_dict[label_id]["name"])
        elif todoist_col == "project_id":
            project_dict = get_todoist_projects()
            project_id = todoist_item.data["project_id"]
            value = project_dict[project_id]["name"]
        elif todoist_col == "parent_id":
            task_dict = get_todoist_tasks()
            task_id = todoist_item.data["parent_id"]
            try:
                value = task_dict[task_id]["content"]
            except KeyError:
                value = None
        else:
            value = todoist_item.data[todoist_col]
        coda_cells.append(Cell(coda_column_dict[coda_col], value))
    return coda_cells


def coda_to_todoist_converter(coda_task: Row) -> dict:
    """
        Convert coda `Row` object into a dictionary for todoist

        Parameters
        ----------
        coda_task : Row
            The coda `Row` object to be converted

        Returns
        -------
        dict
            Dictionary containing the data for the new task
    """
    todoist_task_dict = {}
    for todoist_col, coda_col in zip(TODOIST_COLS[1:], CODA_COLS[1:]):
        if coda_col == "Labels":
            label_dict = {
                label["name"]: label for label_id, label in get_todoist_labels().items()
            }
            for label in coda_task["Labels"]:
                try:
                    value = label_dict[label.value]["id"]
                except KeyError:
                    TODOIST_API.labels.add(label)
                    value = TODOIST_API.commit()["id"]
        elif coda_col == "Project":
            project_dict = {
                project["name"]: project
                for project_id, project in get_todoist_projects().items()
            }
            project = coda_task["Project"]
            try:
                value = project_dict[project]["id"]
            except KeyError:
                TODOIST_API.projects.add(project)
                value = TODOIST_API.commit()["id"]
        elif coda_col == "Due date":
            # FIXME: I just got lazy and did this
            value = None
        elif coda_col == "Dependency":
            task_dict = {
                task["content"]: task for task_id, task in get_todoist_tasks().items()
            }
            value = task_dict[coda_task["Dependency"]]["id"]
        todoist_task_dict[todoist_col] = coda_task[coda_col].value
    return todoist_task_dict


def get_coda_tasktable() -> Table:
    """ Get the task table from coda.io """
    task_doc_id = os.getenv("CODA_TASKDOC_ID")
    task_doc = Document(task_doc_id, coda=CODA_API)
    task_table = [t for t in task_doc.list_tables() if t.name == "Capture"][0]
    return task_table


def sync_tasks(coda_table, todoist_tasks) -> None:
    """
        Sync tasks between todoist and coda.io

        Parameters
        ----------
        coda_table
        todoist_tasks

        Returns
        -------
        None
    """
    coda_rows = coda_table.rows()
    coda_tasks_w_taxid: List[Row] = []
    coda_tasks_wo_taxid: List[Row] = []
    coda_taskids = []
    for coda_row in coda_rows:
        coda_row_data = coda_row.to_dict()
        if coda_row_data["Task ID"] == "":
            coda_tasks_wo_taxid.append(coda_row)
        else:
            coda_tasks_w_taxid.append(coda_row)
            coda_taskids.append(coda_row_data["Task ID"])
    # 1. Additions: Todoist -> Coda
    #    Todoist tasks with Task IDs not in Coda get added
    cells_list = []
    for todoist_task in todoist_tasks:
        if todoist_task["id"] not in coda_taskids:
            cells = todoist_to_coda_converter(todoist_task, coda_table.columns())
            cells_list.append(cells)
    coda_table.upsert_rows(cells_list)
    # 2. Additions: Coda -> Todoist
    #    Coda tasks without Task IDs are added to Todoist
    #    New TaskID is created and copied over to Coda
    for coda_task in coda_tasks_wo_taxid:
        todoist_task_dict = coda_to_todoist_converter(coda_task)
        TODOIST_API.items.add(**todoist_task_dict)
        todoist_task_dict_committed = TODOIST_API.commit()
        coda_taskid_cell = Cell("Task ID", todoist_task_dict_committed["id"])
        coda_table.update_row(coda_task, coda_taskid_cell)
    # 3. Updates: Coda <-> Todoist
    #    Common tasks are updated based on last modified
    #    FIXME: Only syncs changes from Coda -> Todoist (since todoist items don't have a modified entry)
    for coda_row in coda_rows:
        coda_row_data = coda_row.to_dict()
        modified_on = pendulum.parse(coda_row_data["Modified on"])
        created_on = pendulum.parse(coda_row_data["Created on"])
        if modified_on > created_on:
            todoist_task_dict = coda_to_todoist_converter(coda_row)
            TODOIST_API.items.update(todoist_task_dict["id"], **todoist_task_dict)
            TODOIST_API.commit()


def main() -> None:
    """ Sync todoist tasks with coda.io """
    coda_table = get_coda_tasktable()
    todoist_tasks = TODOIST_API.items.all()
    sync_tasks(coda_table, todoist_tasks)


if __name__ == "__main__":
    main()
