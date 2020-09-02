import os

### INIT SCRIPT VARIABLES
USERNAME = os.getlogin()
SCRIPT_PATH = os.getcwd()

### INIT TOOLKIT FOLDERS
TOOLS_PATH = "/usr/share/tools"
WORDLIST_PATH = "/usr/share/wordlists"
BINARIES_PATH = "/usr/share/binaries"
RELEASES_PATH = "/usr/share/releases"
RELEASES_TMP = "/tmp/releases_download"

### INIT MAIN FOLDERS
MAIN_FOLDERS = (TOOLS_PATH, WORDLIST_PATH, BINARIES_PATH, RELEASES_PATH, RELEASES_TMP)

### INIT TOOLKIT LISTS
PACKAGES_LIST = SCRIPT_PATH + "/tools/packages.txt"
GIT_TOOLS_LIST = "/tmp/github.txt"
TOOLS_JSON = SCRIPT_PATH + "/tools/tools.json"
GIT_WORDLISTS_LIST = SCRIPT_PATH + "/tools/wordlists.txt"
RELEASES_LIST = SCRIPT_PATH + "/tools/releases.txt"
BINARIES_LIST = SCRIPT_PATH + "/tools/binaries.txt"
BASH_LIST = SCRIPT_PATH + "/tools/bash-files.txt"