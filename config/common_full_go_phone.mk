# Set Pegasus specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Pegasus stuff
$(call inherit-product, vendor/pegasus/config/common_full_phone.mk)
