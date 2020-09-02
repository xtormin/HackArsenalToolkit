wpscan_installer(){
    cd $TOOLS_PATH/wpscan/
    sudo gem install bundler && bundle config set without 'test development'
    cd $SCRIPT_PATH
}