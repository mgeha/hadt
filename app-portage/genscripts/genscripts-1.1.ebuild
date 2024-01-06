EAPI=8

DESCRIPTION="Collection of administration scripts for Gentoo"
HOMEPAGE="http://hadt.biz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 hppa mips ppc ppc64 sparc x86"

RDEPEND="
	app-portage/portage-utils
	>=app-portage/gentoolkit-0.3"

S=${WORKDIR}

src_unpack() {
	mkdir -p "${S}"
}

src_install() {
	dobin "${FILESDIR}"/upvall.sh || die
	dobin "${FILESDIR}"/damnsmallportage.sh || die
	dobin "${FILESDIR}"/findold.sh || die
	dobin "${FILESDIR}"/oldkernel.sh || die
	dobin "${FILESDIR}"/orphanedrcscripts.sh || die
	dobin "${FILESDIR}"/tmerge.sh || die
	dobin "${FILESDIR}"/psync.sh || die
}
