# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# PegasusOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.pegasus.version=$(PEGASUS_VERSION) \
    ro.pegasus.releasetype=$(PEGASUS_BUILDTYPE) \
    ro.pegasus.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(PEGASUS_VERSION)

# PegasusOS Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.pegasus.display.version=$(PEGASUS_DISPLAY_VERSION)
