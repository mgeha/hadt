# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="StoreBackup is a very space efficient disk-to-disk backup suite for GNU/Linux and other unixoide systems."
HOMEPAGE="http://storebackup.org/"
SRC_URI="http://download.savannah.gnu.org/releases/storebackup/storeBackup-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cron"

RDEPEND="
	app-arch/bzip2
	dev-lang/perl
	cron? ( virtual/cron )"

src_install() {
	if use cron ; then
		dodir /etc/storebackup.d/
		exeinto /etc/cron.daily
		newexe storeBackup/cron-storebackup storebackup
	fi

	dodoc storeBackup/_ATTENTION_ storeBackup/doc/*

	# remove .pl from filenames
	local f
	local n
        for f in storeBackup/man/man1/* ; do
		n=$(basename ${f/.pl/})
                newman "$f" "$n"
        done

	insinto /usr/share/storebackup/lib
	doins storeBackup/lib/*
	# this files need to be executable
	fperms 0755 /usr/share/storebackup/lib/stbuLog.pl
	fperms 0755 /usr/share/storebackup/lib/stbuMd5cp.pl
	fperms 0755 /usr/share/storebackup/lib/stbuMd5Exec.pl

	into /usr/share/storebackup
	dobin storeBackup/bin/*
	# create symlinks

	# remove .pl from filenames
	local f
	local n
        for f in storeBackup/bin/* ; do
		f=$(basename $f)
		n=$(basename ${f/.pl/})
                dosym "/usr/share/storebackup/bin/$f" "/usr/bin/$n"
        done
}
