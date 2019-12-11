import sys
import time
import smtplib
import psutil

pid = int(sys.argv[1])
p = psutil.Process(pid)

name = ' '.join(p.cmdline())
has_finished = False

while(not has_finished):
    try:
        p.status() == "running"
    except:
        has_finished = True
    time.sleep(1)

port = 25
smtp_server = "mail3.hpi.uni-potsdam.de"
sender_email = "midl19t4@hpi.uni-potsdam.de"
receiver_email = ["jonas.noack@student.hpi.de", "joshua.ziemann@student.hpi.de"]

message = """Subject: [MIDL] Process has finished!
    
The following process has finished:
    {name}
""".format(name=name)

with smtplib.SMTP(smtp_server, port) as server:
    server.sendmail(sender_email, receiver_email, message)