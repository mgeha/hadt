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
 
if [ -z "$1" ]; then
  echo
  echo "Usage: $0 <days> [ -emerge ]"
  echo ""
  echo "days      re-merge all packages older than x days"
  echo "-emerge   optinal emerge parameters (like -pv)"
  echo
  echo "example: $0 250 -pv"
  echo
  exit 1
fi

if [ "$2" = "--" ]; then
  find /var/db/pkg/ -name USE -mtime +$1 | \
    sed -e 's/\/var\/db\/pkg\//=/' \
	-e 's/\/USE//'
else
  find /var/db/pkg/ -name USE -mtime +$1 | \
    sed -e 's/\/var\/db\/pkg\//=/' \
	-e 's/\/USE//' |
    xargs emerge $2 --oneshot
fi
