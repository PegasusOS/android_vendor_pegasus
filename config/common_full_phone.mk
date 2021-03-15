# Inherit full common Pegasus stuff
$(call inherit-product, vendor/pegasus/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Pegasus LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/pegasus/overlay/dictionaries

$(call inherit-product, vendor/pegasus/config/telephony.mk)
