#!/bin/bash

emerge --sync

if [ -f /usr/bin/layman ]
  then
    /usr/bin/layman -S
fi

if [ -f /usr/bin/eix-update ]
  then
    /usr/bin/eix-update
fi

if [ -f /etc/init.d/squash_portage ]
  then
    /etc/init.d/squash_portage restart
fi

emerge -Dupv world
