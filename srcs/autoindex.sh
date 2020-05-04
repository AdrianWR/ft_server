#!/bin/bash

# Quick script to set the autoindex function
# of a NGINX server config file using sed.
# The index [on|off] variable can be passed
# as an argument or given by the AUTO_INDEX
# environment variable. This variable is changed
# in current shell session if the script is run
# in the calling shell context.
# e.g. "source /path/to/autoindex.sh"
# e.g. ". /path/to/autoindex.sh"

INDEX=${1:-$AUTO_INDEX}
CONFIG_FILE=/etc/nginx/sites-enabled/ft_server.conf

if [[ "$INDEX" == "off" || "$INDEX" == "on" ]];
then
	sed -i -E "/autoindex/ s/on|off/$INDEX/" $CONFIG_FILE
	export AUTO_INDEX=$INDEX
	nginx -s reload
	echo "Auto index option set to '$INDEX'"
else
	echo "Variable not accepted. Insert 'on' or 'off'"
fi
