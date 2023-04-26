################################################################################
#
# esp8089
#
################################################################################

ESP8089_VERSION = 0f61a8d29368d988fe0254d79474246ca39e997e
ESP8089_SITE = https://github.com/al177/esp8089.git
ESP8089_SITE_METHOD = git
ESP8089_LICENSE = GPL-2.0
ESP8089_LICENSE_FILES = LICENSE

$(eval $(kernel-module))
$(eval $(generic-package))
