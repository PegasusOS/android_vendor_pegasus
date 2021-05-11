#
# Copyright (C) 2021 PegasusOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_BRAND ?= PegasusOS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Dex optimization
USE_DEX2OAT_DEBUG := false
WITH_DEXPREOPT_DEBUG_INFO := false

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/pegasus/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/pegasus/overlay/common

PEGASUSOS_BUILDTYPE ?= NIGHTLY
PRODUCT_VERSION_MAJOR = 11
PRODUCT_VERSION_MINOR = 0

PEGASUSOS_VERSION += $(PRODUCT_BRAND)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(TARGET_PRODUCT)-$(PEGASUSOS_BUILDTYPE)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.pegasusos.version=$(PEGASUSOS_VERSION)

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pegasus/prebuilts/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/pegasus/prebuilts/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/pegasus/prebuilts/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

# System mount
PRODUCT_COPY_FILES += \
    vendor/pegasus/prebuilts/bin/system-mount.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/system-mount.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/pegasus/prebuilts/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/pegasus/prebuilts/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/pegasus/prebuilts/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Pixel APNs
PRODUCT_COPY_FILES += \
    vendor/pegasus/prebuilts/etc/apns-full-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    vendor/pegasus/prebuilts/fonts/google-fonts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

PRODUCT_PACKAGES += \
    GoogleFonts

PRODUCT_PACKAGES += \
    Etar \
    ExactCalculator \
    PegasusThemesStub \
    Phonograph \
    Seedvault \
    SetupWizard \
    Recorder \
    Stk \
    talkback \
    ThemePicker \
    TrichromeChrome \
    TrichromeWebView \
    Updater
