# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Pegasus Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.pegasus.display.version=$(PEGASUS_DISPLAY_VERSION)
