# Set Pegasus specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Pegasus stuff
$(call inherit-product, vendor/pegasus/config/common_mini_phone.mk)
