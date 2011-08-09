USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/huawei/ascend2/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_CPU_ABI := armeabi-v6j
TARGET_BOOTLOADER_BOARD_NAME := M865

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := true

BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei
BOARD_KERNEL_BASE := 0x10200000
BOARD_PAGE_SIZE := 131072

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/ascend2/recovery/recovery_ui.c
BOARD_HAS_NO_SELECT_BUTTON := true

## cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00500000 00020000 "boot"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00140000 00020000 "misc"
# mtd3: 00060000 00020000 "splash"
# mtd4: 0ba00000 00020000 "system"
# mtd5: 03f00000 00020000 "cache"
# mtd6: 0a0a0000 00020000 "userdata"
# mtd7: 01400000 00020000 "userdata2"
# mtd8: 01400000 00020000 "cust"

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0ba00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0a0a0000
BOARD_FLASH_BLOCK_SIZE := 131072

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

TARGET_PREBUILT_KERNEL := device/huawei/ascend2/kernel

