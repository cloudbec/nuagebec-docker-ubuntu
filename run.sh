#!/bin/bash
if [ ! -f /data/persistent/.root_pw_set ]; then
	/data/set_root_pw.sh
fi

# see this bug report for more info https://github.com/cloudbec/nuagebec-docker-ubuntu/issues/1
if [  "$SSH_SERVER" == "false"  ] || [  "$SSH_SERVER" == "FALSE"  ] || [  "$SSH_SERVER" == "0"  ]; then
    sed -i 's/autostart=true/autostart=false/g' /etc/supervisor/conf.d/sshd.conf
fi

exec supervisord -n -c /etc/supervisor/supervisord.conf
