#
# Copyright (C) 2018 The Android Open-Source Project
# Copyright (C) 2019 The LineageOS Project
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

COMMON_PATH := device/nokia/sdm660-common

# Get non-open-source specific aspects
$(call inherit-product, vendor/nokia/sdm660-common/sdm660-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay

# CarrierConfig overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/omni/overlay/CarrierConfig

# Properties
-include $(COMMON_PATH)/system_props.mk

# A/B Partition Scheme
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vbmeta

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Boot Control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libcutils \
    libgptutils \
    libz

# Camera
PRODUCT_PACKAGES += \
    SnapdragonCamera2

# Display
PRODUCT_PACKAGES += \
    libvulkan \
    vendor.display.config@1.0

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

PRODUCT_BOOT_JARS += \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/goodix_fp.kl:system/usr/keylayout/goodix_fp.kl \

# Media
#PRODUCT_COPY_FILES += \
#    $(COMMON_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Omni charger
PRODUCT_PACKAGES += \
    omni_charger_res_images \
    animation.txt \
    font_charger.png

# Omni display
PRODUCT_PACKAGES += \
    OmniDisplayManager

# Permissions
PRODUCT_COPY_FILES += \
	$(COMMON_PATH)/permissions/com.evenwell.datacollect.xml:system/etc/permissions/com.evenwell.datacollect.xml \
        $(COMMON_PATH)/permissions/com.fihtdc.datacollect.xml:system/etc/permissions/com.fihtdc.datacollect.xml \
        $(COMMON_PATH)/permissions/com.fihtdc.hardware.sensor.hall.xml:system/etc/permissions/com.fihtdc.hardware.sensor.hall.xml \
        $(COMMON_PATH)/permissions/com.fihtdc.inlifeui.settings.style.android.xml:system/etc/permissions/com.fihtdc.inlifeui.settings.style.android.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# Vendor default.prop
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/vendor_default.prop:system/etc/vendor_default.prop

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Whitelist
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(COMMON_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(COMMON_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf

# Wi-Fi Display
PRODUCT_BOOT_JARS += \
    WfdCommon
