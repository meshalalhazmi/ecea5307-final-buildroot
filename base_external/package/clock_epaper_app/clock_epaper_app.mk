################################################################################
#
# clock_epaper_app
#
################################################################################

CLOCK_EPAPER_APP_VERSION = 49f997ab3d80a9f172d34d037cb51b2bc97f7b27
CLOCK_EPAPER_APP_SITE = https://github.com/meshalalhazmi/ecea5307-final-e-paper
CLOCK_EPAPER_APP_SITE_METHOD = git
CLOCK_EPAPER_APP_DEPENDENCIES = libgpiod

define CLOCK_EPAPER_APP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
		CPPFLAGS="$(TARGET_CPPFLAGS) -DDEBUG -DRPI -DUSE_DEV_LIB -Iinclude -Ithird_party/waveshare_e_paper/RaspberryPi_JetsonNano/c/lib/Config -Ithird_party/waveshare_e_paper/RaspberryPi_JetsonNano/c/lib/e-Paper -Ithird_party/waveshare_e_paper/RaspberryPi_JetsonNano/c/lib/GUI -Ithird_party/waveshare_e_paper/RaspberryPi_JetsonNano/c/lib/Fonts" \
		LDFLAGS="$(TARGET_LDFLAGS) -lgpiod" \
		-C $(@D)
endef

define CLOCK_EPAPER_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/clock_epaper_app $(TARGET_DIR)/usr/bin/clock_epaper_app
endef

$(eval $(generic-package))
