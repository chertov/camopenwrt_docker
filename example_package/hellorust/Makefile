include $(TOPDIR)/rules.mk

PKG_NAME:=hellorust
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_MAINTAINER:=Chertov Maxim <chertovmv@gmail.com>

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=multimedia
	CATEGORY:=Multimedia
	TITLE:=Simple RTSP daemon for Hisilicon devices
	MAINTAINER:=chertovmv@gmail.com
endef

# define Build/Compile
# 	rustc --target=mips-unknown-linux-gnu -C linker=mips-openwrt-linux-gcc hello.rs
# endef

define Package/$(PKG_NAME)/description
	Simple RTSP daemon for Hisilicon devices
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
	$(CP) ./src/.cargo $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/target/arm-unknown-linux-musleabi/release/hellorust $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
