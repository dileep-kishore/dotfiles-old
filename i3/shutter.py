#!/usr/bin/env python3

import datetime
import os
import subprocess
import sys
import time


def internet_blocker(files):
    for file in files:
        stats = os.stat(file)
        last_modfied = time.time() - stats.st_mtime
        if last_modfied < (3 * 60 * 60):
            subprocess.run(["shutdown", "-P"])

def night_shutter():
    curr_dt = datetime.datetime.now()
    if curr_dt.hour >= 23 or curr_dt.hour <= 3:
        if curr_dt.minute >= 30:
            h = str(curr_dt.hour + 1)
            t = "00"
        else:
            h = str(curr_dt.hour)
            t = "30"
        shut_time = h + ":" + t
        subprocess.run(["shutdown", "-h", shut_time])


if __name__ == "__main__":
    FILES = sys.argv[1:]
    internet_blocker(FILES)
    night_shutter()
