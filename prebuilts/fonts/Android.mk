LOCAL_PATH:= $(call my-dir)

GOOGLE_FONTS := \
    GoogleSans-Bold.ttf \
    GoogleSans-BoldItalic.ttf \
    GoogleSans-Italic.ttf \
    GoogleSans-Medium.ttf \
    GoogleSans-MediumItalic.ttf \
    GoogleSans-Regular.ttf

define define-google-font
include $$(CLEAR_VARS)
LOCAL_MODULE := $1
LOCAL_MODULE_OWNER := google
LOCAL_SRC_FILES := fonts/$1
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/fonts
LOCAL_PRODUCT_MODULE := true
include $$(BUILD_PREBUILT)
endef

$(foreach font,$(GOOGLE_FONTS),\
    $(eval $(call define-google-font,$(font))))

include $(CLEAR_VARS)
LOCAL_MODULE := GoogleFonts
LOCAL_MODULE_OWNER := google
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := $(GOOGLE_FONTS)
include $(BUILD_PHONY_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE := fonts_customization.xml
LOCAL_SRC_FILES := fonts_customization.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)
