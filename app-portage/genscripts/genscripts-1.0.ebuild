# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Collection of administration scripts for Gentoo"
HOMEPAGE="http://www.hadt.biz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="alpha amd64 hppa ia64 mips ppc ppc64 sparc x86"

RDEPEND="
	app-portage/portage-utils
	>=app-portage/gentoolkit-0.3"

src_install() {
	dobin "${FILESDIR}"/upvall.sh || die
	dobin "${FILESDIR}"/damnsmallportage.sh || die
	dobin "${FILESDIR}"/findold.sh || die
	dobin "${FILESDIR}"/oldkernel.sh || die
	dobin "${FILESDIR}"/orphanedrcscripts.sh || die
	dobin "${FILESDIR}"/tmerge.sh || die
	dobin "${FILESDIR}"/psync.sh || die
}
