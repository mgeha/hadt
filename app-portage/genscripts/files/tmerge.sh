#!/bin/bash

. /etc/make.conf
. /etc/init.d/functions.sh


mount | grep "tmpfs on /var/tmp/portage type tmpfs" > /dev/null
if [ $? -eq 0 ]
then
	einfo "tmpfs is already mounted"
else
	einfo "mounting tmpfs"
	mount -t tmpfs -o noatime,nodiratime tmpfs /var/tmp/portage
fi

einfo "running emerge ${*}"
emerge ${*}

mount | grep "tmpfs on /var/tmp/portage type tmpfs" > /dev/null
if [ $? -eq 0 ]
then
	einfo "unmount tmpfs"
	umount /var/tmp/portage
fi
