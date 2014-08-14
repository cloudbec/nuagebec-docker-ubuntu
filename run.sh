#!/bin/bash
if [ ! -f /.root_pw_set ]; then
	/set_root_pw.sh
fi
#exec /usr/sbin/sshd -D

#!/bin/bash
exec supervisord -n -c /etc/supervisor/supervisord.conf

