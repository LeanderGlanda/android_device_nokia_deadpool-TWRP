# File originally from https://github.com/RaghuVarma331/android_device_nokia_SLD_sprout-TWRP
# (modified)

ALLOW_MISSING_DEPENDENCIES=true

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
	boot \
	system \
	vendor

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=ext4 \
	POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
	otapreopt_script \
	update_engine \
	update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
	bootctl \
	update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
	bootctrl.sdm429
	
# Encryption
PRODUCT_PACKAGES += \
	qcom_decrypt \
	qcom_decrypt_fbe \
	tzdata_twrp

PRODUCT_PACKAGES += \
	libgptutils \
	libz

PRODUCT_PACKAGES += \
	charger_res_images \
	charger \
	
# Additional libs required by encryption services
PRODUCT_HOST_PACKAGES += \
	libandroidicu
	
# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := \
	device/nokia/deadpool/recovery/root/etc/recovery.wipe

## Device identifier. This must come after all inclusions

PRODUCT_NAME := twrp_deadpool
PRODUCT_DEVICE := deadpool
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 3.2
PRODUCT_MANUFACTURER := Nokia
