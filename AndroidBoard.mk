LOCAL_PATH := $(call my-dir)

<<<<<<< HEAD
file := $(TARGET_ROOT_OUT)/init.huawei.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.huawei.rc | $(ACP)
=======
file := $(TARGET_ROOT_OUT)/init.qcom.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.qcom.rc | $(ACP)
>>>>>>> ab9df076f69ae8f78ffcc5234f78bb9aa7c895f5
	$(transform-prebuilt-to-target)


# include the non-open-source counterpart to this file
-include vendor/huawei/ascend2/AndroidBoardVendor.mk
