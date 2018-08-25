# Kernel
include vendor/pegasus/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pegasus/config/BoardConfigQcom.mk
endif

# Soong
include vendor/pegasus/config/BoardConfigSoong.mk

