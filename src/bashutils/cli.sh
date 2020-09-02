
usage(){
    # HEEEEEELP message
	cat <<-'EOF'
	Usage: $SCRIPTNAME
	
	SCANMAP description
	
	OPTIONS:
		-h  --help  		Show this help information
		-v	--reset-folders	Delete created directories and reinstall and download script resources (tools, wordlists, binaries, etc.)

	EXAMPLES:

		# Install toolkit
		sudo bash hackarsenal.sh

		# Delete created directories (reset)
		sudo bash hackarsenal.sh -r

	EOF
}

cli(){
	# Translate --long-options to -l short options
	local arg=
	for arg; do
		local delim=""
		case $arg in
			--help)		args="${args}-h";;
			--reset-folders)		args="${args}-r";;
			*) [[ "${arg:0:1}" == "-" ]] || delim="\""
                args="${args}${delim}${arg}${delim} ";;
		esac
	done

	#Reset the positional parameters to the short options
	eval set -- $args

	# Args actions
	while getopts "hr" OPTION ; do
        case $OPTION in
			h)
				usage
				exit 0
				;;
			r)
				echo "holii"
				sudo rm -rf $TOOLS_PATH $WORDLIST_PATH $BINARIES_PATH $RELEASES_PATH $RELEASES_TMP
				;;
        esac
    done
}

