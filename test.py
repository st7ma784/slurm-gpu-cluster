#!/usr/bin/env python3
  
import time
import os
import socket
from datetime import datetime as dt
if __name__ == '__main__':
    print('Process started {}'.format(dt.now()))
    print('NODE : {}'.format(socket.gethostname()))
    print('PID  : {}'.format(os.getpid()))
    print('Executing for 5 secs')
    time.sleep(5)
    print('Process finished {}\n'.format(dt.now()))
    import torch
    print(torch.cuda.is_available())