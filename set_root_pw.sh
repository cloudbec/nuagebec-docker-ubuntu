#!/bin/bash

if [ -f /data/persistant/.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /data/persistent/.root_pw_set

echo "========================================================================"
echo "You can now connect to this Ubuntu container via SSH using:"
echo ""
echo " for reach 1st interface ip"
echo " ssh -p <port> root@"$(ip -o -4 addr show | awk -F '[ /]+' '/global/ {print $4}' | head -n1)
echo ""
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
