wpscan_installer(){
    cd $TOOLS_PATH/wpscan/
    sudo gem install bundler && bundle install --without test development
    cd $SCRIPT_PATH
}