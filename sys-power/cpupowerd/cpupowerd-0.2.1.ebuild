inherit eutils

DESCRIPTION="A daemon which controls the frequency and voltage of CPUs."
HOMEPAGE="http://sourceforge.net/projects/cpupowerd/"
SRC_URI="mirror://sourceforge/cpupowerd/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""


src_unpack() {
    unpack ${A}
    cd ${S}/src
}

src_compile() {
	cd src/
	make -e CC="$(tc-getCC) ${CFLAGS}" || die
}

src_install() {
	dosbin src/cpupowerd || die

	dodoc CHANGELOG README TODO
	docinto tools
	dodoc tools/*

	newinitd "${FILESDIR}"/cpupowerd.init cpupowerd
}

pkg_postinst() {
	elog "You have to configure cpupowerd first!"
}

