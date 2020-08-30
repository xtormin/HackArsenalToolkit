source src/utils.sh

gitclone_to_path(){
    cd $1
    for url in $(cat $2); do git clone $url ; done
    cd $SCRIPT_PATH
}

install_packages(){ 
    sudo apt install $1 -y 
}

download_github_release(){
    local owner
    local file

    cd $1
    for i in $(cat $2); do 
        owner=$(echo $i | cut -d',' -f1)
        file=$(echo $i | cut -d',' -f2)
        tool_name=$(echo $owner | cut -d'/' -f2)
        tool_dir=$1/$tool_name
        mkdir -p $tool_dir
        cd $tool_dir
        echo "|+| Downloading $tool_name from $owner repository"
        for i in $(curl -s https://api.github.com/repos/$owner/releases/latest | grep $file | cut -d : -f2,3 | tr -d \", | grep ^.http)
            do echo $i | wget -qi -
        done
    done    
    cd $SCRIPT_PATH
}

dw_inst_bash(){
    cd $RELEASES_TMP
    for i in $(cat $BASH_LIST); do
    
        curl $i > install && chmod 755 install && ./install
    done
    cd $SCRIPT_PATH 
}

i_release(){
    
    for i in $(ls $RELEASES_TMP/*/*); do
        cd $RELEASES_PATH
        decompress $i
        cd $SCRIPT_PATH
    done
    for i in $(ls $RELEASES_TMP); do
        cd $RELEASES_PATH
        i_bin $i
        cd $SCRIPT_PATH
    done
    
}