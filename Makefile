THEOS_PACKAGE_DIR_NAME = debs
TARGET = iphone:clang::9.0
ARCHS = armv7 armv7s arm64 arm64e
# TARGET = simulator:clang::7.0
# ARCHS = x86_64 i386
# i386 slice is required for 32-bit iOS Simulator (iPhone 5, etc.)
DEBUG = 0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2223

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MessagesPls
MessagesPls_FILES = MessagesPls.xm
MessagesPls_CFLAGS = -fobjc-arc -Wno-deprecated-declarations

include $(THEOS_MAKE_PATH)/tweak.mk

ifneq (,$(filter x86_64 i386,$(ARCHS)))
setup:: clean all
	@rm -f /opt/simject/$(TWEAK_NAME).dylib
	@cp -v $(THEOS_OBJ_DIR)/$(TWEAK_NAME).dylib /opt/simject/$(TWEAK_NAME).dylib
	@codesign -f -s - /opt/simject/$(TWEAK_NAME).dylib
	@cp -v $(PWD)/$(TWEAK_NAME).plist /opt/simject
endif
