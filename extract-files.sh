#!/bin/sh
DEVICE=ascend2
if [ "$1" = "adb" ]
then
echo "Using ADB pull to extract files."
cmd="adb"

elif [ "$1" = "cp" ]
then

if [ $# -lt 2 ]
then
echo "Cannot use copy operation without a path! Path should lead to the base directory of a ROM. ex. /home/user/somerom/"
exit
else
echo "Using copy operation to extract files."
cmd="cp"
fi

else
echo "Invalid syntax. Script must be called with the following parameters..."
echo "./extract-files.sh adb : This will pull files from your device using ADB."
echo "./extract-files.sh cp /path/to/ROM : This will copy files from a directory."
exit

fi
rm -rf ../../../vendor/huawei/$DEVICE/proprietary
mkdir -p ../../../vendor/huawei/$DEVICE/proprietary
DIRS="
etc
etc/bluetooth
etc/firmware
lib/egl
lib/hw
bin
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/huawei/$DEVICE/proprietary/$DIR
done

FILES="
etc/vold.fstab
etc/init.qcom.bt.sh
etc/apns-conf.xml
etc/wifi/wpa_supplicant.conf
etc/AudioFilter.csv
etc/AutoVolumeControl.txt
etc/firmware/yamato_pfp.fw
etc/firmware/yamato_pm4.fw
etc/init.qcom.coex.sh
etc/init.qcom.fm.sh
etc/init.qcom.post_boot.sh
etc/init.qcom.sdio.sh
etc/bluetooth/BCM4329.hcd

wifi/firmware.bin
wifi/firmware_apsta.bin
wifi/nvram.txt
wifi/bcm_loadecho.sh
wifi/bcm_loadipf.sh
wifi/connectap.sh
wifi/iwconfig
wifi/iwlist
wifi/iwpriv
wifi/nvram.txt
wifi/udp_server

lib/libril-qc-1.so
lib/libril-qcril-hook-oem.so
lib/libgsl.so
lib/libdiag.so
lib/libcm.so
lib/liboncrpc.so
lib/libqmi.so
lib/libdsm.so
lib/libqueue.so
lib/libdll.so
lib/libmmgsdilib.so
lib/libgsdi_exp.so
lib/libgstk_exp.so
lib/libwms.so
lib/libnv.so
lib/libwmsts.so
lib/libpbmlib.so
lib/libdss.so
lib/libauth.so
lib/libcamera.so
lib/liboemcamera.so
lib/libcameraservice.so
lib/libcamera_client.so
lib/libmmjpeg.so
lib/libmmipl.so
lib/libmm-adspsvc.so
lib/libOmxAacDec.so
lib/libOmxWmvDec.so
lib/libOmxAdpcmDec.so
lib/libOmxH264Dec.so
lib/libOmxAmrDec.so
lib/libOmxAmrwbDec.so
lib/libOmxWmaDec.so
lib/libOmxMp3Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxAmrRtpDec.so
lib/libOmxAacEnc.so
lib/libOmxEvrcEnc.so
lib/libOmxAmrEnc.so
lib/libOmxQcelp13Enc.so
lib/libOmxVidEnc.so
lib/libomx_aacdec_sharedlibrary.so
lib/libomx_amrdec_sharedlibrary.so
lib/libomx_amrenc_sharedlibrary.so
lib/libomx_avcdec_sharedlibrary.so
lib/libomx_m4vdec_sharedlibrary.so
lib/libomx_mp3dec_sharedlibrary.so
lib/libomx_sharedlibrary.so
lib/libreference-ril.so
lib/libril.so
lib/liboem_rapi.so
lib/libcommondefs.so
lib/libloc_api-rpc-qc.so
lib/libmmprocess.so
lib/libhwrpc.so
lib/libSwypeCore.so

bin/oem_rpc_svc
bin/vold
bin/modempre
bin/wpa_supplicant
bin/wl
bin/port-bridge
bin/brcm_patchram_plus
bin/qmuxd
bin/akmd8962
bin/akmd8975
bin/compassd

lib/hw/sensors.default.so
lib/hw/lights.msm7k.so
lib/hw/copybit.msm7k.so
lib/hw/gralloc.msm7k.so
lib/hw/gps.default.so

lib/egl/libEGL_adreno200.so
lib/egl/libGLESv2_adreno200.so
lib/egl/libGLESv1_CM_adreno200.so
lib/egl/libq3dtools_adreno200.so
"

for FILE in $FILES; do
if [ "$cmd" = "adb" ]
then
	adb pull /system/$FILE ../../../vendor/huawei/$DEVICE/proprietary/$FILE
elif [ "$cmd" = "cp" ]
then
        cp $2/system/$FILE ../../../vendor/huawei/$DEVICE/proprietary/$FILE
fi
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/huawei/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \\
    vendor/huawei/ascend2/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so 


PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \\
    vendor/huawei/ascend2/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \\
    vendor/huawei/ascend2/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/huawei/ascend2/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \\
    vendor/huawei/ascend2/proprietary/lib/libgsl.so:system/lib/libgsl.so \\
    vendor/huawei/ascend2/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \\
    vendor/huawei/ascend2/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/bin/qmuxd:system/bin/qmuxd \\
    vendor/huawei/ascend2/proprietary/bin/akmd8962:system/bin/akmd8962 \\
    vendor/huawei/ascend2/proprietary/bin/akmd8975:system/bin/akmd8975 \\
    vendor/huawei/ascend2/proprietary/bin/compassd:system/bin/compassd \\
    vendor/huawei/ascend2/proprietary/lib/libdiag.so:system/lib/libdiag.so \\
    vendor/huawei/ascend2/proprietary/lib//libcm.so:system/lib/libcm.so \\
    vendor/huawei/ascend2/proprietary/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \\
    vendor/huawei/ascend2/proprietary/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \\
    vendor/huawei/ascend2/proprietary/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \\
    vendor/huawei/ascend2/proprietary/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \\
    vendor/huawei/ascend2/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \\
    vendor/huawei/ascend2/proprietary/lib/libqmi.so:system/lib/libqmi.so \\
    vendor/huawei/ascend2/proprietary/lib/libdsm.so:system/lib/libdsm.so \\
    vendor/huawei/ascend2/proprietary/lib/libqueue.so:system/lib/libqueue.so \\
    vendor/huawei/ascend2/proprietary/lib/libdll.so:system/lib/libdll.so \\
    vendor/huawei/ascend2/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \\
    vendor/huawei/ascend2/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \\
    vendor/huawei/ascend2/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \\
    vendor/huawei/ascend2/proprietary/lib/libwms.so:system/lib/libwms.so \\
    vendor/huawei/ascend2/proprietary/lib/libnv.so:system/lib/libnv.so \\
    vendor/huawei/ascend2/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \\
    vendor/huawei/ascend2/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \\
    vendor/huawei/ascend2/proprietary/lib/libdss.so:system/lib/libdss.so \\
    vendor/huawei/ascend2/proprietary/lib/libauth.so:system/lib/libauth.so 

# Camera
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/huawei/ascend2/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/huawei/ascend2/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \\
    vendor/huawei/ascend2/proprietary/lib/liboemcamera.so:obj/lib/liboemcamera.so \\
    vendor/huawei/ascend2/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \\
    vendor/huawei/ascend2/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \\
    vendor/huawei/ascend2/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \\
    vendor/huawei/ascend2/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \\
    vendor/huawei/ascend2/proprietary/lib/libmm-adspsvc.so:/system/lib/libmm-adspsvc.so 

# OMX
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/libOmxWmvDec.so:/system/lib/libOmxWmvDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAacDec.so:/system/lib/libOmxAacDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAdpcmDec.so:/system/lib/libOmxAdpcmDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxH264Dec.so:/system/lib/libOmxH264Dec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAmrDec.so:/system/lib/libOmxAmrDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAmrwbDec.so:/system/lib/libOmxAmrwbDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxWmaDec.so:/system/lib/libOmxWmaDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxMp3Dec.so:/system/lib/libOmxMp3Dec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxMpeg4Dec.so:/system/lib/libOmxMpeg4Dec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAmrRtpDec.so:/system/lib/libOmxAmrRtpDec.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAacEnc.so:/system/lib/libOmxAacEnc.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxEvrcEnc.so:/system/lib/libOmxEvrcEnc.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxAmrEnc.so:/system/lib/libOmxAmrEnc.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxQcelp13Enc.so:/system/lib/libOmxQcelp13Enc.so \\
    vendor/huawei/ascend2/proprietary/lib/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \\
    vendor/huawei/ascend2/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so

# HW
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \\
    vendor/huawei/ascend2/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \\
    vendor/huawei/ascend2/proprietary/lib/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \\
    vendor/huawei/ascend2/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so 

# vendor
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/bin/oem_rpc_svc:system/bin/oem_rpc_svc \\
    vendor/huawei/ascend2/proprietary/bin/modempre:system/bin/modempre \\
    vendor/huawei/ascend2/proprietary/lib/liboem_rapi.so:/system/lib/liboem_rapi.so \\
    vendor/huawei/ascend2/proprietary/lib/libcommondefs.so:/system/lib/libcommondefs.so \\
    vendor/huawei/ascend2/proprietary/lib/libloc_api-rpc-qc.so:/system/lib/libloc_api-rpc-qc.so \\
    vendor/huawei/ascend2/proprietary/lib/libmmprocess.so:system/lib/libmmprocess.so\\
    vendor/huawei/ascend2/proprietary/lib/libhwrpc.so:system/lib/libhwrpc.so \\
    vendor/huawei/ascend2/proprietary/lib/libhwrpc.so:obj/lib/libhwrpc.so 

# wifi
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant \\
    vendor/huawei/ascend2/proprietary/bin/wl:system/bin/wl 

# bluetooth
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/bin/port-bridge:system/bin/port-bridge \\
    vendor/huawei/ascend2/proprietary/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \\
    vendor/huawei/ascend2/proprietary/etc/bluetooth/BCM4329.hcd:system/etc/bluetooth/BCM4329.hcd 

# ril
PRODUCT_COPY_FILES += \\
    vendor/huawei/ascend2/proprietary/lib/libreference-ril.so:/system/lib/libreference-ril.so \\
    vendor/huawei/ascend2/proprietary/lib/libril.so:/system/lib/libril.so 

# Swype
PRODUCT_COPY_FILE += \\
    vendor/huawei/ascend2/proprietary/lib/libSwypeCore.so:system/lib/libSwypeCore.so


EOF

./setup-makefiles.sh

