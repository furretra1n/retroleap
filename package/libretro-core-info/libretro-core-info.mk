################################################################################
#
# LIBRETRO-CORE-INFO
#
################################################################################
LIBRETRO_CORE_INFO_VERSION = 7744a25a0e418703e24a4bd7a2208d5a12ae8a7a
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/configs/.config/retroarch/cores
	$(INSTALL) -D $(@D)/*.info \
		$(TARGET_DIR)/configs/.config/retroarch/cores
endef

$(eval $(generic-package))
