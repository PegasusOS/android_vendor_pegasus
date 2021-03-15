# Inherit mini common Pegasus stuff
$(call inherit-product, vendor/pegasus/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
