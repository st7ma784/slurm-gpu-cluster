#!/bin/bash

sudo service munge start
conda run -p /root/open-ce jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

