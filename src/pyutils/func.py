try:
    import os
    import json
    import shutil
    import subprocess
    from pathlib import Path
    from subprocess import Popen, PIPE, STDOUT, check_call

except ImportError as ie:
    print(ie)

def create_directories(folders):
    print("|+| Creating main folders")
    for i in folders:
        try:
            Path(i).mkdir(parents=True, exist_ok=True)
            print("  |+| Folder " + i + " created")

        except Exception as e:
            print("  |-| Error creating " + i + " folder")
            print(e)

def change_permissions(folders,user):
    try:
        aux = user + ':' + user
        for folder in folders:
            subprocess.call(['chown', '-R', aux, folder])
    except Exception as e:
        print(e)

def read_file(f):
    try:
        f = open(f)
        text = []
        return f.read()
        f.close()
    except Exception as e:
        print(e)

def write_file(outputfile, text):
    try:
        f = open(outputfile, 'w')
        f.write(text)
        f.close()
    except Exception as e:
        print(e)

def read_json(f):
    with open(f) as json_f:
        data = json.load(json_f)
    return data

def create_txt_from_json(json_f,key,out_txt):
    data = read_json(json_f)
    output = ""
    for i in data:
        for k,v in i.items():
            if k == key:
                output = output + v + "\n"
    write_file(out_txt, output)

