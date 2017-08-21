# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit linux-mod git-r3

DESCRIPTION="Work in progress input driver for the SPI keyboard/trackpad found on MacBooks"
HOMEPAGE="https://github.com/roadrunner2/macbook12-spi-driver"

EGIT_REPO_URI="https://github.com/roadrunner2/macbook12-spi-driver"
EGIT_BRANCH="touchbar-driver-hid-driver"
SRC_URI=""
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${P}

MODULE_NAMES="applespi(custom:${S}:${S}) appletb(custom:${S}:${S})"
BUILD_TARGETS="clean all"

CONFIG_CHECK="MODULES MFD_INTEL_LPSS_PCI SPI_PXA2XX"

src_install() {
	linux-mod_src_install
	dodoc README.md
	insinto /etc/udev/hwdb.d
	doins "${FILESDIR}/61-evdev-local.hwdb"
	doins "${FILESDIR}/61-libinput-local.hwdb"
}
