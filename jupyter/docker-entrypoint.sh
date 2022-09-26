#!/bin/bash

sudo service munge start
#conda run --name open-ce 
sudo service slurmd start

sudo jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

tail -f /dev/null
