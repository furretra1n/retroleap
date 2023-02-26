#############################################################################
#
# snes9x4d
#
#############################################################################

SNES9X4D_VERSION = e8023a5
SNES9X4D_SITE = https://github.com/m45t3r/snes9x4d.git
SNES9X4D_SITE_METHOD = git
SNES9X4D_LICENSE = GPLv3
SNES9X4D_LICENSE_FILES = COPYING
SNES9X4D_DEPENDENCIES = sdl sdl_image sdl_ttf
SNES9X4D_INSTALL_STAGING = NO
SNES9X4D_GIT_SUBMODULES = YES


define SNES9X4D_BUILD_CMDS
        CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE)  CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" ARCH=arm -C $(@D) -f Makefile all
endef

define SNES9X4D_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/snes9x4d $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))

