# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/gnome-light/gnome-light-2.20.3.ebuild,v 1.7 2008/06/05 11:51:11 remi Exp $

inherit eutils

S=${WORKDIR}
DESCRIPTION="Meta package for psychostats"
HOMEPAGE=""
LICENSE="as-is"
SLOT="0"
IUSE=""

KEYWORDS="x86"

RDEPEND="
	dev-perl/XML-Simple
	dev-perl/GD"

pkg_setup() {
	if ! built_with_use dev-perl/GD png; then
		eerror ""
		eerror "To be able to install psychostats-deps you need"
		eerror "to have built dev-perl/GD with the png USE flag."
		die "Missing png USE flag on dev-perl/GD"
	fi
}
