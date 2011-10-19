
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/huawei/ascend2/BoardConfigVendor.mk

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=device/huawei/ascend2/include/prelink-linux-arm.map


TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := M865


BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei
BOARD_KERNEL_BASE := 0x10200000
BOARD_PAGE_SIZE := 0x00000800

TARGET_PREBUILT_KERNEL := device/huawei/ascend2/kernel

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0ba00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a0a0000
BOARD_FLASH_BLOCK_SIZE := 131072

WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# Graphics
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
#BOARD_NO_RGBX_8888 := true

# OpenGL drivers config file path
BOARD_EGL_CFG := device/huawei/ascend2/include/egl.cfg

# GPS
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := M865
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 6225

# Audio
TARGET_PROVIDES_LIBAUDIO := true

# FM Radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := bcm4329

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_PATH := "/system/wifi/dhd.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/wifi/firmware.bin"
WIFI_DRIVER_FW_AP_PATH  := "/system/wifi/firmware_apsta.bin"
WIFI_DRIVER_MODULE_ARG  := "firmware_path=/system/wifi/firmware.bin nvram_path=/system/wifi/nvram.txt"

# SDCard
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

# recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/huawei/ascend2/recovery/recovery_kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/huawei/ascend2/recovery/recovery_ui.c

TARGET_OTA_ASSERT_DEVICE := ascend2,M865

