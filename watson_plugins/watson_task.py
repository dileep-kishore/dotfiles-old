#!/usr/bin/python

import watson

conn = watson.Watson()

if conn.current:
    curr_proj = conn.current['project'].strip()
    start_time = conn.current['start'].humanize()
    print(f"\uf4a0  {curr_proj} \uf6d8 {start_time}")
else:
    print("")
