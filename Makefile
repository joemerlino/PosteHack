DEBUG=0

TARGET := iphone:clang:latest:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PosteHack

PosteHack_FILES = Tweak.xm
PosteHack_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk