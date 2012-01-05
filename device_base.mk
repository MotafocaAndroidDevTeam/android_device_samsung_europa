# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxy5/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxy5/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni \
    SpareParts \
    Development \
    Term \
    make_ext4fs \
    brcm_patchram_plus \
    gralloc.msm7k \
    copybit.msm7k \
    setup_fs \
    libaudioutils \
    libtinyalsa \
    libOmxCore \
    libOmxVidEnc \
    libOmxVenc \
    libOmxVdec \
    FileManager \
    screencap \
    audio.a2dp.default \
    dexpreopt \
    abtfilt \
    hwcomposer.msm7k \
    zipalign \
    Superuser \
    Camera

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/ueventd.gt-i5500.rc:root/ueventd.gt-i5500.rc \
    device/samsung/galaxy5/default.prop:root/default.prop \
    device/samsung/galaxy5/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/galaxy5/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/galaxy5/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/galaxy5/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/galaxy5/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/galaxy5/init.gt-i5500.rc:root/init.gt-i5500.rc

## wifi module
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/galaxy5/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/galaxy5/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/galaxy5/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/galaxy5/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/galaxy5/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/galaxy5/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/galaxy5/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/galaxy5/prebuilt/wmiconfig:system/bin/wmiconfig 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/galaxy5/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/galaxy5/prebuilt/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/galaxy5/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/audio.primary.galaxy5.so:system/lib/hw/audio.primary.galaxy5.so\
    device/samsung/galaxy5/prebuilt/audio_policy.galaxy5.so:system/lib/hw/audio_policy.galaxy5.so\
    device/samsung/galaxy5/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/galaxy5/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/galaxy5/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/galaxy5/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/galaxy5/prebuilt/hosts:system/etc/hosts \
    device/samsung/galaxy5/prebuilt/init.local.rc:system/etc/init.local.rc \
    device/samsung/galaxy5/prebuilt/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/galaxy5/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxy5/prebuilt/europa_headset.kl:system/usr/keylayout/europa_headset.kl \
    device/samsung/galaxy5/prebuilt/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/galaxy5/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/galaxy5/prebuilt/europa_keypad0.kl:system/usr/keylayout/europa_keypad0.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/qwerty.kcm.bin:system/usr/keylayout/qwerty.kcm.bin \
    device/samsung/galaxy5/prebuilt/qwerty2.kcm.bin:system/usr/keylayout/qwerty2.kcm.bin \
    device/samsung/galaxy5/prebuilt/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/galaxy5/prebuilt/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/galaxy5/prebuilt/BCM2049B0_BCM20780B0_002.001.022.0170.0174.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd

## Sensor
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/gpsd:system/bin/gpsd \
    device/samsung/galaxy5/prebuilt/qmuxd:system/bin/qmuxd \
    device/samsung/galaxy5/prebuilt/gps.msm7k.so:system/vendor/lib/hw/gps.msm7k.so \
    device/samsung/galaxy5/prebuilt/gps.msm7k.so:system/lib/hw/gps.msm7k.so \
    device/samsung/galaxy5/prebuilt/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/samsung/galaxy5/prebuilt/sensors.default.so:system/lib/hw/sensors.default.so \
    device/samsung/galaxy5/prebuilt/gpsd:system/vendor/bin/gpsd \
    device/samsung/galaxy5/prebuilt/memsicd:system/bin/memsicd 

## 3D
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/galaxy5/prebuilt/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/galaxy5/prebuilt/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/galaxy5/prebuilt/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/galaxy5/prebuilt/libgsl.so:system/lib/libgsl.so \
    device/samsung/galaxy5/prebuilt/egl.cfg:system/lib/egl/egl.cfg 

## GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/galaxy5/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

## other media
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
    device/samsung/galaxy5/prebuilt/bootsound:system/bin/bootsound \
    device/samsung/galaxy5/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/galaxy5/prebuilt/poweron.ogg:system/media/poweron.ogg

## ril
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/libdiag.so:system/lib/libdiag.so \
    device/samsung/galaxy5/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/galaxy5/prebuilt/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/galaxy5/prebuilt/libril.so:system/lib/libril.so 

## script
PRODUCT_COPY_FILES += \
    device/samsung/galaxy5/prebuilt/01sysctl:system/etc/init.d/01sysctl \
    device/samsung/galaxy5/prebuilt/04modules:system/etc/init.d/04modules \
    device/samsung/galaxy5/prebuilt/20userinit:system/etc/init.d/20userinit \
    device/samsung/galaxy5/prebuilt/99complete:system/etc/init.d/99complete 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
