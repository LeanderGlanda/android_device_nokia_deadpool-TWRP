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
	android.hardware.keymaster@4.0-service \
	android.hardware.keymaster@3.0-service \
	android.hardware.keymaster@4.0 \
	android.hardware.keymaster@3.0 \
	qcom_decrypt \
	qcom_decrypt_fbe \
	tzdata_twrp

PRODUCT_PACKAGES += \
# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
# SHARED_LIBRARY_MODULE := \
	bootctrl.sdm429 \
	libgptutils \
	libz
#	libandroidicu \
#	libhardware_legacy \
#	android.hardware.keymaster@4.0-service
#	android.hardware.keymaster@4.0 \
#	libkeymaster4 \
#	libkeymaster41

#LOCAL_REQUIRED_MODULES += \
# PRODUCT_REQUIRED_MODULES += \
#	android.hardware.keymaster@4.0-service

# PRODUCT_COPY_FILES += \
#    $(OUT_DIR)/target/product/deadpool/vendor/bin/hw/android.hardware.keymaster@4.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.keymaster@4.0-service \
#    $(OUT_DIR)/target/product/deadpool/vendor/bin/hw/android.hardware.keymaster@3.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.keymaster@3.0-service \
#    $(LOCAL_PATH)/recovery/root/system/etc/init/android.hardware.keymaster@4.0-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.keymaster@4.0-service.rc \
#    $(LOCAL_PATH)/recovery/root/system/etc/init/android.hardware.keymaster@3.0-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.keymaster@3.0-service.rc
#    $(OUT_DIR)/target/product/deadpool/vendor/etc/init/android.hardware.keymaster@4.0-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.keymaster@4.0-service.rc
#    $(OUT_DIR)/target/product/deadpool/vendor/etc/init/android.hardware.keymaster@3.0-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.keymaster@3.0-service.rc
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/system/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc \
	$(LOCAL_PATH)/recovery/root/system/etc/init/android.hardware.keymaster@4.0-service-qti.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/android.hardware.keymaster@4.0-service-qti.rc \
	$(LOCAL_PATH)/recovery/root/system/etc/init/vendor.qti.hardware.qseecom@1.0-service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/init/vendor.qti.hardware.qseecom@1.0-service.rc

#PRODUCT_COPY_FILES += \
#	$(OUT_DIR)/target/product/deadpool/system/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4.so \
#	$(OUT_DIR)/target/product/deadpool/system/lib64/libpuresoftkeymasterdevice.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libpuresoftkeymasterdevice.so

#PRODUCT_COPY_FILES += \
#    $(OUT_DIR)/target/product/$(PRODUCT_RELEASE_NAME)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

PRODUCT_PACKAGES += \
	charger_res_images \
	charger \
	
# Partitions (listed in the file) to be wiped under recovery.
TARGET_RECOVERY_WIPE := \
	device/nokia/deadpool/recovery/root/etc/recovery.wipe

## Device identifier. This must come after all inclusions

PRODUCT_NAME := twrp_deadpool
PRODUCT_DEVICE := deadpool
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 3.2
PRODUCT_MANUFACTURER := Nokia
