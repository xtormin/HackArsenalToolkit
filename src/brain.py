#!/usr/bin/python3

try:
    import os
    import json
    import getpass
    import subprocess
    from pyutils.config import *
    from pyutils.func import *
except ImportError as ie:
    print(ie)

def prompt_sudo():
    out = 0
    if os.geteuid() != 0:
        msg = "[sudo] password for %u:"
        out = subprocess.check_call("sudo -v -p '%s'" % msg, shell=True)
    return out

def main():

    ### CHECK ROOT PRIVILEGES
    if prompt_sudo() != 0:
        print('''
|+| Installation require root privileges
    Try again with sudo: sudo bash hackarsenal.sh\n
        ''')

    ### CREATE MAIN FOLDERS
    create_directories(MAIN_FOLDERS)

    ### CHANGE PERMISSIONS BY LOGGED USER
    change_permissions(MAIN_FOLDERS,USERNAME)

    ### PARSE JSON TOOLS
    create_txt_from_json(TOOLS_JSON,"url",GIT_TOOLS_LIST)
    
if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(e)