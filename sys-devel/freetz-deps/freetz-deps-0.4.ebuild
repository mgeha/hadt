# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome-light/gnome-light-2.20.3.ebuild,v 1.7 2008/06/05 11:51:11 remi Exp $

inherit eutils

S=${WORKDIR}
DESCRIPTION="Meta package for freetz"
HOMEPAGE=""
LICENSE="as-is"
SLOT="0"
IUSE=""

KEYWORDS="x86 amd64"

RDEPEND="
	>=sys-devel/automake-1.4_p6
	dev-vcs/subversion
	dev-util/ftjam
	app-arch/unzip
	app-misc/realpath
	dev-util/intltool"
