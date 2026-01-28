################################################################################
#
# clock_epaper_app
#
################################################################################

CLOCK_EPAPER_APP_VERSION = 1.0
CLOCK_EPAPER_APP_SITE = /home/meshal/Desktop/courses/ECEA_5305/final_project/final_app
CLOCK_EPAPER_APP_SITE_METHOD = local
CLOCK_EPAPER_APP_DEPENDENCIES = libgpiod

define CLOCK_EPAPER_APP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define CLOCK_EPAPER_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/clock_epaper_app $(TARGET_DIR)/usr/bin/clock_epaper_app
endef

$(eval $(generic-package))
