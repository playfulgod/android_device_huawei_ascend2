$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/ascend2/ascend2-vendor.mk)

$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/ascend2/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/huawei/ascend2/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_ascend2
PRODUCT_DEVICE = hwm865
PRODUCT_MODEL := Huawei-M865
PRODUCT_LOCALES := en_US
PRODUCT_DEFAULT_REGION := US


PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    libcamera \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt \
    gps.M865 \


DISABLE_DEXPREOPT := false

# Vold
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/vold.fstab:system/etc/vold.fstab \
    device/huawei/ascend2/vold/:system/bin/vold 

# bluetooth
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# apns-conf.xml
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Root init
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/init.huawei.rc:root/init.huawei.rc \
    device/huawei/ascend2/include/ueventd.rc:root/ueventd.rc 


# Audio
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/ascend2/include/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt 

#Media profile
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/etc/media_profiles.xml:system/etc/media_profiles.xml

# Wifi firmware
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/prebuilt/wifi/dhd.ko:system/lib/modules/dhd.ko \
    device/huawei/ascend2/prebuilt/wifi/firmware.bin:system/wifi/firmware.bin \
    device/huawei/ascend2/prebuilt/wifi/firmware_apsta.bin:system/wifi/firmware_apsta.bin \
    device/huawei/ascend2/prebuilt/wifi/nvram.txt:system/wifi/nvram.txt \
    device/huawei/ascend2/prebuilt/wifi/bcm_loadecho.sh:system/wifi/bcm_loadecho.sh \
    device/huawei/ascend2/prebuilt/wifi/bcm_loadipf.sh:system/wifi/bcm_loadipf.sh \
    device/huawei/ascend2/prebuilt/wifi/connectap.sh:system/wifi/connectap.sh \
    device/huawei/ascend2/prebuilt/wifi/iwconfig:system/wifi/iwconfig \
    device/huawei/ascend2/prebuilt/wifi/iwlist:system/wifi/iwlist \
    device/huawei/ascend2/prebuilt/wifi/iwpriv:system/wifi/iwpriv \
    device/huawei/ascend2/prebuilt/wifi/nvram.txt:system/wifi/nvram.txt \
    device/huawei/ascend2/prebuilt/wifi/udp_server:system/wifi/udp_server 


# DHCP Config
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/prebuilt/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \



##Added Files for bootsound and themes
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/app/RoverCyan.apk:system/app/RoverCyan.apk \
    device/huawei/ascend2/include/app/com.mike.theme.hc3d3d-1.apk:system/app/com.mike.theme.hc3d3d-1.apk \
    device/huawei/ascend2/include/app/DarkADBWireless-v1.apk:system/app/DarkADBWireless-v1.apk \
    device/huawei/ascend2/include/app/com.elgubbo.a2sdGUI-1.apk:system/app/com.elgubbo.a2sdGUI-1.apk \
    device/huawei/ascend2/include/bin/bootsound:system/bin/bootsound \
    device/huawei/ascend2/include/media/audio/ui/android_audio.mp3:system/media/audio/ui/android_audio.mp3 \
    device/huawei/ascend2/include/media/bootanimation.zip:system/media/bootanimation.zip \
    device/huawei/ascend2/include/etc/hosts:system/etc/hosts \
    device/huawei/ascend2/include/etc/init.local.rc:system/etc/init.local.rc



# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


# M865 uses mid-density
PRODUCT_LOCALES += mdpi



PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=90 \
    ro.sf.lcd_density=160 \
    ro.com.android.dataroaming=false \
    ro.config.play.bootsound=1



PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_virtualsdcard=true \
    ro.config.srs.equalizer=true \
    ro.config.srs.default.type=1 \
    ro.config.hw_new_double_signal=1 \
    ro.config.hw_fast_dormancy=1 \
    ro.config.hw_camera_resize=true \
    debug.sf.hw=0 \
    ro.config.hw_menu_unlockscreen=false \
    ro.config.hw_allow_g_map=false \
    ro.config.hw_voicerecord=true \
    ro.config.hw_GSensorOptimize=true \
    ro.config.hw_proximity=true \
    ro.config.hw_opta=92 \
    ro.config.hw_optb=156 \
    ro.telephony.default_network=4 \
    ro.com.google.clientidbase=android-cricket-us
    ro.cdma.home.operator.alpha=Cricket \
    ro.cdma.home.operator.numeric=31016 \
    ro.config.cdma_subscription=1 \
    ro.cdma.voicemail.number=mine \
    ro.com.google.locationfeatures=1 \

# Perfomance tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=32m \
    dalvik.vm.dexopt-data-only=1

# apps2sd
#$(call inherit-product-if-exists, include/a2sd/a2sd.mk)
