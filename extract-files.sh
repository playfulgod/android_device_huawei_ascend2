#!/bin/sh

mkdir -p ../../../vendor/huawei/ascend2/proprietary

DIRS="
bin
etc
lib/hw
"
for DIR in $DIRS; do
	mkdir -p ../../../vendor/huawei/ascend2/proprietary/$DIR
done

FILES="
bin/akmd8962
bin/akmd8975
bin/qmuxd
bin/modempre
bin/oem_rpc_svc
bin/hci_qcomm_init

lib/libmm-adspsvc.so
lib/libOmxH264Dec.so
lib/libOmxMpeg4Dec.so
lib/libOmxVidEnc.so
lib/libOmxCore.so

lib/libril-qc-1.so
lib/liboncrpc.so
lib/libdsm.so
lib/libqueue.so
lib/libauth.so
lib/libcm.so
lib/libdiag.so
lib/libmmgsdilib.so
lib/libgsdi_exp.so
lib/libgstk_exp.so
lib/libwms.so
lib/libnv.so
lib/libwmsts.so
lib/libril-qcril-hook-oem.so
lib/libril.so
lib/libdss.so
lib/libdll.so
lib/libqmi.so
lib/libpbmlib.so
lib/libwpa_client.so
lib/liboem_rapi.so
lib/libhwrpc.so

lib/hw/gralloc.msm7k.so
lib/hw/sensors.default.so
lib/hw/lights.msm7k.so
lib/hw/copybit.msm7k.so
lib/hw/gralloc.msm7k.so
lib/hw/libbcmfm_if.so

lib/libaudioeq.so
lib/libcamera.so
lib/libqcamera.so
lib/libmmjpeg.so
lib/libmmipl.so
lib/libmmprocess.so

etc/init.qcom.bt.sh
etc/init.qcom.fm.sh
etc/init.qcom.coex.sh
"
for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/huawei/ascend2/proprietary/$FILE
done

chmod 755 ../../../vendor/huawei/ascend2/proprietary/bin/* 
