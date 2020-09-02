#!/bin/bash

source src/bashutils/banner.sh
source src/core.sh

### BANNER (I know, this is obvious xD)
banner

### PYTHON SETUP
python_setup

### CREATE AND PARSE INFORMATION
python3 src/brain.py

### DOWNLOAD AND INSTALL PROGRAMS
main