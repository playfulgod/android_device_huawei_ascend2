#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

#$(call inherit-product-if-exists, vendor/huawei/ascend2/ascend2-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/ascend2/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/ascend2/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    copybit.M865 \
    gps.M865 \
    libRS \
    hwprops \
    rzscontrol \
    libOmxCore \
    libmm-omxcore \
    libOmxVidEnc \
    Gallery \
    librs_jni \
    LiveWallpapersPicker

# Live Wallpapers support
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# SDCARD
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/vold.fstab:system/etc/vold.fstab

# Compcache module
#PRODUCT_COPY_FILES += \
#    device/huawei/ascend2/modules/ramzswap.ko:system/lib/modules/ramzswap.ko

# Input
PRODUCT_COPY_FILES += \
	device/huawei/ascend2/modules/evbug.ko:system/lib/modules/evbug.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/initlogo.rle:root/initlogo.rle \
    device/huawei/ascend2/init.qcom.rc:root/init.qcom.rc \
    device/huawei/ascend2/include/ueventd.ascend2.rc:root/ueventd.ascend2.rc \

# DHCP config for wifi
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd.conf \
    vendor/huawei/ascend2/proprietary/etc/dhcpcd/dhcpcd-hooks:system/etc/dhcpcd/dhcpcd-hooks \
    vendor/huawei/ascend2/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks

# qcom stuff
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/01_qcomm_omx.cfg:system/etc/01_qcomm_omx.cfg \
    vendor/huawei/ascend2/proprietary/etc/init.goldfish.sh:system/etc/init.goldfish.sh \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    vendor/huawei/ascend2/proprietary/etc/iq.img.vfat:system/etc/iq.img.vfat 

# Keylayouts
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/keychars/surf_keypad.kcm.bin:system/usr/keychars/surf_keypad.kcm.bin \
    device/huawei/ascend2/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    vendor/huawei/ascend2/proprietary/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen/multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    vendor/huawei/ascend2/proprietary/etc/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    vendor/huawei/ascend2/proprietary/etc/permissions/qcnvitems.xml:system/etc/permissions/qcnvitems.xml \
    vendor/huawei/ascend2/proprietary/etc/permissions/qcrilhook.xml:system/etc/permissions/qcrilhook.xml

# 3D
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/huawei/ascend2/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    vendor/huawei/ascend2/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/huawei/ascend2/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/huawei/ascend2/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/huawei/ascend2/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/huawei/ascend2/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/huawei/ascend2/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/huawei/ascend2/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=90 \
    ro.sf.lcd_density=160 \
    ro.com.android.dataroaming=false

# Default network type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65537

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m \
    persist.sys.use_dithering=1 \
    persist.sys.purgeable_assets=1 \
    ro.compcache.default=18

# Don't put dexfiles in /cache on ascend2
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# Media configuration xml file
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/media_profiles.xml:system/etc/media_profiles.xml

# wpa_supplicant configuration file
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Proprietary hardware related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/huawei/ascend2/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/huawei/ascend2/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/huawei/ascend2/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/huawei/ascend2/proprietary/lib/libmmprocess.so:system/lib/libmmprocess.so \
    vendor/huawei/ascend2/proprietary/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \

# Sound and OMX
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/huawei/ascend2/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/huawei/ascend2/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/huawei/ascend2/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/huawei/ascend2/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/huawei/ascend2/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so

# Lights and graphics
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    vendor/huawei/ascend2/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so

# Sensors
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/bin/akmd8962:system/bin/akmd8962 \
    vendor/huawei/ascend2/proprietary/bin/akmd8975:system/bin/akmd8975 \
    vendor/huawei/ascend2/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

# GPS
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/etc/gps.conf:system/etc/gps.conf \

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/huawei/ascend2/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/huawei/ascend2/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/huawei/ascend2/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/huawei/ascend2/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/huawei/ascend2/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/huawei/ascend2/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/huawei/ascend2/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/huawei/ascend2/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/huawei/ascend2/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/huawei/ascend2/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/huawei/ascend2/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/huawei/ascend2/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/huawei/ascend2/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/huawei/ascend2/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/huawei/ascend2/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/huawei/ascend2/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/huawei/ascend2/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/huawei/ascend2/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/huawei/ascend2/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so \
    vendor/huawei/ascend2/proprietary/bin/qmuxd:system/bin/qmuxd \

# OEM RPC
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend2/proprietary/bin/modempre:system/bin/modempre \
    vendor/huawei/ascend2/proprietary/bin/oem_rpc_svc:system/bin/oem_rpc_svc \
    vendor/huawei/ascend2/proprietary/lib/libhwrpc.so:system/lib/libhwrpc.so \
    vendor/huawei/ascend2/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so

## Wifi related
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/modules/dhd.ko:system/lib/modules/dhd.ko \
    vendor/huawei/ascend2/proprietary/wifi/firmware_apsta.bin:system/wifi/firmware_apsta.bin \
    vendor/huawei/ascend2/proprietary/wifi/nvram.txt:system/wifi/nvram.txt

## Bluetooth related
PRODUCT_COPY_FILES += \
     vendor/huawei/ascend2/proprietary/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
     vendor/huawei/ascend2/proprietary/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
     vendor/huawei/ascend2/proprietary/etc/bluetooth/BCM4329.hcd:system/etc/bluetooth/BCM4329.hcd \
     vendor/huawei/ascend2/proprietary/lib/libbluetooth.so:system/lib/libbluetooth.so
     
$(call inherit-product, build/target/product/small_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_ascend2
PRODUCT_DEVICE := ascend2
PRODUCT_MODEL := Huawei-M865

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google-us \
    ro.com.google.locationfeatures=1 \
    ro.cdma.home.operator.numeric=31016 \
    ro.config.cdma_subscription=1 \
    ro.cdma.voicemail.number=mine \
    ro.setupwizard.enable_bypass=1 \
    ro.config.play.bootsound=1
