#!/bin/bash

emerge --sync && layman -S && eix-update

if [ -f /etc/init.d/squash_portage ]
  then
    /etc/init.d/squash_portage restart
fi

emerge -Dupv world