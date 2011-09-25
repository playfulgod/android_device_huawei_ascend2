LOCAL_PATH := $(call my-dir)

file := $(TARGET_ROOT_OUT)/init.huawei.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.huawei.rc | $(ACP)
	$(transform-prebuilt-to-target)


# include the non-open-source counterpart to this file
-include vendor/huawei/ascend2/AndroidBoardVendor.mk
