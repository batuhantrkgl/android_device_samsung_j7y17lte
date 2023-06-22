#
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

DEVICE_PATH := device/samsung/j7y17lte

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml

# Launch Android API level
PRODUCT_SHIPPING_API_LEVEL := 23

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Graphics
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Bluetooth hal
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Bluetooth audio
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung.a3y17lte

# Fingerprint Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml
    
# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/576nits_config/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# GPS configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps_debug.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps_debug.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps_debug.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.2.vendor

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    mobicore.rc \
    init.wifi_device.rc

# Shims
PRODUCT_PACKAGES += \
    libbauthtzcommon_shim

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    device/samsung/universal7870-common/local-modules/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal \
    libwpa_client \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf

#hostpad
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0

#wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.4

#supplicant
PRODUCT_PACKAGES += \
    android.hardware.wifi.supplicant@1.3

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Custom mixer_paths OSS
#PRODUCT_COPY_FILES += \
#$(LOCAL_PATH)/configs/audio/oss/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml

# Inherit from common (audio)
#$(call inherit-product, device/samsung/universal7870-common/device-oss_audio.mk)

# Custom mixer_paths prebuilt
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/prebuilt/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/configs/audio/prebuilt/mixer_gains.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_gains.xml

# Inherit from common
 $(call inherit-product, device/samsung/universal7870-common/device-prebuilt_audio.mk)

# Properties
-include $(DEVICE_PATH)/system_prop.mk

# Inherit from common
$(call inherit-product, device/samsung/universal7870-common/device-common.mk)

# $(call inherit-product, device/samsung/universal7870-common/device-prebuilt_bsp-vndk.mk)

$(call inherit-product-if-exists, vendor/samsung/j7y17lte/j7y17lte-vendor.mk)
