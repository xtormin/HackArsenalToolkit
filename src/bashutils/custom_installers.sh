wpscan_installer(){
    cd $TOOLS_PATH/wpscan/
    sudo gem install bundler && bundle config set without 'test development'
    cd $SCRIPT_PATH
}

i_theHarvester(){
    cd $TOOLS_PATH/theHarvester/
    python3 -m pip install -r requirements/base.txt
    sudo python3 setup.py install
    cd $SCRIPT_PATH
}