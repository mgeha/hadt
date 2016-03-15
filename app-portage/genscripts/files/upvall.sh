#!/bin/sh
#    Copyright (c) 2006-2007 by Michael Hampicke
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

if [ ! -f /usr/bin/equery ]
  then
    /bin/echo "/usr/bin/equery does NOT exist! Please emerge app-portage/gentoolkit"
    exit 1
fi

MERGE=$( equery list -i '*' | sed -e 's/-r[0-9].*$//;s/\(^.*\/*\)-.*$/\1/' \
                              -e 's/=//' \
                              -e '/* installed packages/d' )

emerge -upv --deep --oneshot $MERGE