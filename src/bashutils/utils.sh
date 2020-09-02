decompress(){
    f_type=$(file -b $1 | cut -d' ' -f1)
    if [[ $f_type == "Zip" ]]; then 
        unzip $1
    elif [[ $f_type == "7-zip" ]]; then 
        7z e $1
    elif [[ $f_type == "PE32" ]]; then
        sudo cp $1 $BINARIES_PATH
    else
        echo ""
    fi
}

i_bin(){
    f_type=$(file -b $1 | cut -d' ' -f1)
    if [[ $f_type == "ELF" ]]; then 
        chmod +x $1 ; sudo cp $1 /usr/bin/$1
    fi
}