source src/aux.sh
source src/func.sh
source src/custom_installers.sh



main(){
    banner

    ### INIT SCRIPT VARIABLES
    readonly SCRIPT_NAME="$(basename "$0")"
    readonly SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"
    readonly ARGS="$@"

    ### INIT TOOLKIT VARIABLES
    TOOLS_PATH="/usr/share/tools"
    WORDLIST_PATH="/usr/share/wordlists"
    BINARIES_PATH="/usr/share/binaries"
    RELEASES_PATH="/usr/share/releases"
    RELEASES_TMP="/tmp/releases_download"
    USERNAME=$(whoami)

    GIT_TOOLS_LIST="$SCRIPT_PATH/tools/github.txt"
    GIT_WORDLISTS_LIST="$SCRIPT_PATH/tools/wordlists.txt"
    RELEASES_LIST="$SCRIPT_PATH/tools/releases.txt"
    BINARIES_LIST="$SCRIPT_PATH/tools/binaries.txt"
    BASH_LIST="$SCRIPT_PATH/tools/bash-files.txt"
    PACKAGES_ARRAY=$(cat $SCRIPT_PATH/tools/packages.txt | tr '\r\n' ' ') 

    ### ARGUMENTS
	cli $ARGS    
    
    ### UPDATE REPOSITORIES
    echo "|+| Updating repositories"
    sudo apt update -y

    ### CREATE TOOLS AND WORDLISTS FOLDERS
    # Change folders owner and permissions
    for path in $(echo $TOOLS_PATH $WORDLIST_PATH $BINARIES_PATH $RELEASES_PATH $RELEASES_TMP); do
        echo "|+| Creating folder '$path'"
        sudo mkdir $path
        sudo chmod 755 $path
        sudo chown -R $USERNAME:$USERNAME $path
    done

    ### INSTALL PACKAGES
    install_packages "${PACKAGES_ARRAY}"
    
    ### DOWNLOAD GIT RESOURCES
    # Usage: gitclone_to_path path_to_save_repos git_url_list.txt
    gitclone_to_path $TOOLS_PATH $GIT_TOOLS_LIST
    gitclone_to_path $WORDLIST_PATH $GIT_WORDLISTS_LIST

    ### DOWNLOAD RELEASES
    # Download release from github
    # Usage: download_release path_to_save_releases releases_list
    download_github_release $RELEASES_TMP $RELEASES_LIST
    download_github_release $BINARIES_PATH $BINARIES_LIST

    # INSTALL BINARIES
    i_release

    # DOWNLOAD AND INSTALL BASH FILES
    dw_inst_bash

    # CUSTOM INSTALLS
    wpscan_installer

    cat <<-EOF
    
Your new arsenal directories:
|+| $TOOLS_PATH - Tools from github
|+| $WORDLIST_PATH - Wordlists
|+| $RELEASES_PATH - Releases (Decompressed and installed)
|+| $BINARIES_PATH - Tools for install in victim systems

	EOF
}