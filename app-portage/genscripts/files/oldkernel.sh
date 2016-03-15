#!/bin/bash

zcat /proc/config.gz > /usr/src/linux/.config
make -C /usr/src/linux/ oldconfig
