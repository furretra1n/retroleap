#############################################################################
#
# snes9x4d
#
#############################################################################

POCKETSNES_VERSION = e8023a5
POCKETSNES_SITE = https://github.com/m45t3r/snes9x4d.git
POCKETSNES_SITE_METHOD = git
POCKETSNES_LICENSE = GPLv3
POCKETSNES_LICENSE_FILES = COPYING
POCKETSNES_DEPENDENCIES = sdl sdl_image sdl_ttf
POCKETSNES_INSTALL_STAGING = NO
POCKETSNES_GIT_SUBMODULES = YES


define POCKETSNES_BUILD_CMDS
        CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE)  CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" ARCH=arm -C $(@D) -f Makefile all
endef

define SNES9X4D_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/snes9x4d $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))

