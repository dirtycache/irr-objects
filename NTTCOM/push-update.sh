#!/bin/env bash

# add some crap here to die if $1 is not defined
# maybe add --from and --reply-to options?
# for that matter, --sign-as? would have to be in the keyring of the running user, though.

WORKDIR=$1

AUTODBM="auto-dbm@rr.ntt.net"
FROM="noc@mid.net"
REPLYTO="noc@mid.net"

cd $WORKDIR

while read OBJ ; do
	/usr/bin/gpg --quiet --clearsign $OBJ
	cat $OBJ.asc | /usr/bin/mailx -s "updates" -r "MIDnet NOC <noc@mid.net>" -S replyto="noc@mid.net" $AUTODBM
	/usr/bin/rm $OBJ.asc
done <<< `ls`
