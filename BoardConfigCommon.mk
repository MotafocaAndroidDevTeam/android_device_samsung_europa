# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

TARGET_SPECIFIC_HEADER_PATH := device/samsung/galaxy5/include

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# for now
USE_CAMERA_STUB := false

TARGET_NO_BOOTLOADER := true

BOARD_USES_ADRENO_200 := true
TARGET_HAVE_HDMI_OUT := false

TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/galaxy5/recovery_kernel
TARGET_RECOVERY_INITRC := device/samsung/galaxy5/recovery.rc
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

USE_OPENGL_RENDERER := true
COPYBIT_MSM7K := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_USES_OVERLAY := true
TARGET_GRALLOC_USES_ASHMEM := true
BOARD_NO_RGBX_8888 := true

BOARD_USES_QCOM_HARDWARE := true

BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := galaxy5
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

BOARD_CUSTOM_USB_CONTROLLER := ../../device/samsung/galaxy5/UsbController.cpp

TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := galaxy5

# assert
TARGET_OTA_ASSERT_DEVICE := galaxy5,GT-I5500

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# BOARD_PREBUILT_LIBAUDIO := true
# BOARD_USES_AUDIO_LEGACY := true
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

BOARD_HAVE_FM_RADIO := false
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := bcm4325

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
BOARD_WLAN_DEVICE           := ar6000
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := ar6000

WITH_JIT := false
ENABLE_JSC_JIT := false

TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

JS_ENGINE := v8

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxy5/prebuilt/egl.cfg

# No fallback font by default (space savings)
#NO_FALLBACK_FONT:=true

BOARD_GPS_LIBRARIES := libloc_api

BOARD_MOBILEDATA_INTERFACE_NAME = "pdp0"

BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/vold/179:1
BOARD_SDEXT_DEVICE := /dev/block/vold/179:2
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH  := "/sys/devices/platform/usb_mass_storage/lun0/file"

# Recovery
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 186122240
BOARD_USERDATAIMAGE_PARTITION_SIZE := 203161600
BOARD_FLASH_BLOCK_SIZE             := 4096
BOARD_KERNEL_CMDLINE := 
BOARD_BML_BOOT                     := "/dev/block/bml9"
BOARD_BML_RECOVERY                 := "/dev/block/bml10"

BOARD_RECOVERY_HANDLES_MOUNT       := true
BOARD_LDPI_RECOVERY := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING   := ../../device/samsung/galaxy5/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS              := ../../../device/samsung/galaxy5/recovery/graphics.c
