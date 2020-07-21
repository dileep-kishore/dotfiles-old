#!/usr/bin/env python3

import subprocess


process = subprocess.run(["toggl", "now"], stdout=subprocess.PIPE)
output = process.stdout.decode("utf-8")
try:
    result = [s.strip() for s in output.split("\n")]
    title, *rest = result
    data = {r.split(":", 1)[0]: r.split(":", 1)[-1].strip() for r in rest}
    project = data["Project"].split("(")[0]
    duration = data["Duration"]
    display = f" {project}: {duration}"
except:
    display = " Stopped!"

print(display)
