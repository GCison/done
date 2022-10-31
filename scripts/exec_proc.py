import time
import os
import sys

def worker_update():
    time_update = int(sys.argv[1]) 

    while True:
        os.system("~/cison/html/done/scripts/worker_update.sh")
        time.sleep(time_update)

worker_update()
