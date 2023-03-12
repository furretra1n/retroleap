#############################################################################
#
# st_sdl
#
#############################################################################

ST_SDL_VERSION = 4992bcc
ST_SDL_SITE = https://github.com/lfdevvel/st-sdl.git
ST_SDL_SITE_METHOD = git
ST_SDL_LICENSE = GPLv3
ST_SDL_LICENSE_FILES = COPYING
ST_SDL_DEPENDENCIES = sdl sdl_image sdl_ttf
ST_SDL_INSTALL_STAGING = NO

define ST_SDL_BUILD_CMDS
	CROSS_COMPILE="$(TARGET_CROSS)" $(MAKE) -C $(@D) -f Makefile st
endef

define ST_SDL_INSTALL_TARGET_CMDS
        $(INSTALL) -D $(@D)/st $(TARGET_DIR)/usr/bin/st	
endef

$(eval $(generic-package))

