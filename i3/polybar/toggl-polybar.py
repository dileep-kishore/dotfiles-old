#!/usr/bin/env python3

import subprocess


process = subprocess.run(["toggl", "now"], stdout=subprocess.PIPE)
output = process.stdout.decode("utf-8")
try:
    result = [s.strip() for s in output.split("\n")]
    title, *rest = result
    data = {r.split(":", 1)[0]: r.split(":", 1)[-1].strip() for r in rest}
    short_title = f"{title[:20]}..."
    project = data["Project"].split("(")[0]
    duration = data["Duration"]
    display = f" {short_title} -  {project}: {duration}"
except:
    display = " Stopped!"

print(display)
