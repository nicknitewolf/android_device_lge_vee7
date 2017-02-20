AUDIO_HAL_PATH := $(call my-dir)

ifeq ($(strip $(BOARD_USES_LEGACY_MSM8X25_AUDIO)),true)
    include $(AUDIO_HAL_PATH)/audio_hal/Android.mk
endif
 
