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

DEVICE_PATH := device/lge/vee7

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# inherit from the proprietary version
-include vendor/lge/vee7/BoardConfigVendor.mk

# Compiler flags
BOARD_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
BOARD_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
BOARD_GLOBAL_CFLAGS += -DUSE_MDP3
BOARD_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5

TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := vee7

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=vee7 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01300000
ifeq ($(HOST_OS),linux)
  KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
else
  KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/darwin-x86/arm/arm-eabi-4.8/bin
endif
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
TARGET_KERNEL_SOURCE := kernel/lge/msm7x27a
TARGET_KERNEL_CONFIG := lineageos_vee7_defconfig

# Assert
TARGET_OTA_ASSERT_DEVICE := vee7,p710,P710

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_LEGACY_MSM8X25_AUDIO := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := false
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := false

# Bionic
BOARD_USES_LEGACY_MMAP := true
MALLOC_SVELTE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' -DBOARD_CHARGING_CMDLINE_VALUE='"charger"'

# Dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# Display
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_CACHEIMAGE_PARTITION_SIZE := 159383552
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1270874112
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1941962752
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 27
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_QCOM_BSP := true
TARGET_USES_ION := true
TARGET_PROVIDES_LIBLIGHT := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
USE_DEVICE_SPECIFIC_GPS := true

# Hardware
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/cmhw

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_vee7
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_vee7.cpp

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
BOARD_GLOBAL_CFLAGS += -DBOARD_CANT_REALLOCATE_OMX_BUFFERS
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# Radio
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_CLASS += ../../../$(DEVICE_PATH)/libril

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

ifeq ($(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += device/lge/vee7/twrp
TW_INCLUDE_CRYPTO := true
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi

# Debugging
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
endif

# Wlan
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_EXT_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME := "librasdioif"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"
