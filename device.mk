#
# Copyright (C) 2017 The LineageOS Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/vee7/vee7-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/vee7/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    libaudio-resampler \
    libaudioparameter \
    libaudioutils \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27a

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/chargerlogo:/sbin/chargerlogo \
    $(LOCAL_PATH)/charger/images/battery_charging_01.png:/res/images/chargerimages/battery_charging_01.png \
    $(LOCAL_PATH)/charger/images/battery_charging_02.png:/res/images/chargerimages/battery_charging_02.png \
    $(LOCAL_PATH)/charger/images/battery_charging_03.png:/res/images/chargerimages/battery_charging_03.png \
    $(LOCAL_PATH)/charger/images/battery_charging_04.png:/res/images/chargerimages/battery_charging_04.png \
    $(LOCAL_PATH)/charger/images/battery_charging_05.png:/res/images/chargerimages/battery_charging_05.png \
    $(LOCAL_PATH)/charger/images/battery_charging_06.png:/res/images/chargerimages/battery_charging_06.png \
    $(LOCAL_PATH)/charger/images/battery_charging_07.png:/res/images/chargerimages/battery_charging_07.png \
    $(LOCAL_PATH)/charger/images/battery_charging_08.png:/res/images/chargerimages/battery_charging_08.png \
    $(LOCAL_PATH)/charger/images/battery_charging_bg.png:/res/images/chargerimages/battery_charging_bg.png \
    $(LOCAL_PATH)/charger/images/battery_charging_complete.png:/res/images/chargerimages/battery_charging_complete.png \
    $(LOCAL_PATH)/charger/images/battery_charging_warning.png:/res/images/chargerimages/battery_charging_warning.png \
    $(LOCAL_PATH)/charger/images/battery_charging_warning_eng_1.png:/res/images/chargerimages/battery_charging_warning_eng_1.png \
    $(LOCAL_PATH)/charger/images/battery_trickle_ani_01.png:/res/images/chargerimages/battery_trickle_ani_01.png \
    $(LOCAL_PATH)/charger/images/battery_trickle_ani_02.png:/res/images/battery_trickle_ani_02.png \
    $(LOCAL_PATH)/charger/images/battery_wait_ani_01.png:/res/images/chargerimages/battery_wait_ani_01.png \
    $(LOCAL_PATH)/charger/images/battery_wait_ani_02.png:/res/images/chargerimages/battery_wait_ani_02.png

# Display
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    memtrack.msm7x27a \
    hwcomposer.msm7x27a \
    libgenlock \
    liboverlay \

# Filesystem
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    resize2fs \
    setup_fs

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/librasdioif.ko:system/lib/modules/librasdioif.ko \
    $(LOCAL_PATH)/firmware/wlan.ko:system/lib/modules/wlan.ko

# HALS
PRODUCT_PACKAGES +=  \
    gps.msm7x27a \
    power.msm7x27a \
    lights.msm7x27a

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    $(LOCAL_PATH)/configs/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    $(LOCAL_PATH)/configs/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/keylayout/vee7_keypad.kl:system/usr/keylayout/vee7_keypad.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# OMX
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw 

# Qcom SoftAP
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libstlport

# Qosmgr
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qosmgr_rules.xml:system/etc/qosmgr_rules.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    system-rw.sh

PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# WCN1314
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCN1314_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCN1314_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCN1314_qcom_fw.bin:system/etc/wifi/WCN1314_qcom_fw.bin \
    $(LOCAL_PATH)/wifi/WCN1314_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    libcnefeatureconfig \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf
