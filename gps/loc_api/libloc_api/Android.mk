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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := gps.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES:= \
    libloc_api-rpc

LOCAL_SHARED_LIBRARIES := \
    librpc \
    libutils \
    libcutils

LOCAL_SRC_FILES += \
    loc_eng.cpp \
    loc_eng_ioctl.cpp \
    loc_eng_xtra.cpp \
    loc_eng_ni.cpp \
    loc_eng_log.cpp \
    loc_eng_cfg.cpp \
    gps.c

LOCAL_CFLAGS += \
    -fno-short-enums \
    -DAMSS_VERSION=$(BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION)

ifeq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION),20000)
    LOCAL_CFLAGS += -DLIBLOC_USE_GPS_PRIVACY_LOCK=1
endif
ifeq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION),50000)
    LOCAL_CFLAGS += -DLIBLOC_USE_GPS_PRIVACY_LOCK=1
endif
ifeq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION),1240)
    LOCAL_CFLAGS += -DLIBLOC_USE_GPS_PRIVACY_LOCK=1
    LOCAL_CFLAGS += -DLIBLOC_USE_DEFAULT_RESPONSE_TIME_AND_ACCURACY=1
endif

LOCAL_C_INCLUDES:= \
    $(TARGET_OUT_HEADERS)/libloc_api-rpc \
    $(TARGET_OUT_HEADERS)/libloc_api-rpc/inc \
    $(TARGET_OUT_HEADERS)/libcommondefs-rpc/inc \
    $(TARGET_OUT_HEADERS)/librpc

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

include $(BUILD_SHARED_LIBRARY)
