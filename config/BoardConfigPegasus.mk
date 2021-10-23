include vendor/pegasus/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pegasus/config/BoardConfigQcom.mk
endif

include vendor/pegasus/config/BoardConfigSoong.mk
