# File originally from https://github.com/RaghuVarma331/android_device_nokia_SLD_sprout-TWRP
# (modified)

PLATFORM_PATH := device/nokia/deadpool

TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1520

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm429
TARGET_NO_BOOTLOADER := true
# TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := sdm429
TARGET_BOARD_PLATFORM_GPU := qcom-adreno509
TARGET_USES_64_BIT_BINDER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_serial_dm,0x78B0000 androidboot.usbconfigfs=true loop.max_part=7
TARGET_PREBUILT_KERNEL := device/nokia/deadpool/prebuilt/kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# mkbootimg
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6570876416
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_WIPE := $(PLATFORM_PATH)/recovery/root/system/etc/recovery.wipe

# A/B device flags
TARGET_NO_KERNEL := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_UPDATER := true

# Encryption
PLATFORM_VERSION := 127
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# TWRP specific build flags
ALLOW_MISSING_DEPENDENCIES := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80
TW_THEME := portrait_hdpi
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_RECOVER_PIXEL_FORMAT := RGBA
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
# TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888" (I'm not sure which to use)
RECOVERY_VARIANT := twrp

# Exclude a few things so we get some free space
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_DEVICE_MODULES += \
	android.hidl.base@1.0 \
	vendor.display.config@1.0 \
	vendor.display.config@2.0 \
	libandroidicu \
	android.hidl.allocator@1.0 \
	android.hidl.memory@1.0 \
	android.hidl.memory.token@1.0 \
	android.system.suspend@1.0 \
	libhardware_legacy \
	libxml2 \
	libhidlmemory

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
	$(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libhardware_legacy.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.system.suspend@1.0.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so
	
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.base@1.0.so

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/deadpool/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# SELinux
BOARD_SEPOLICY_DIRS += device/nokia/deadpool/sepolicy

# Extras
#BOARD_SUPPRESS_SECURE_ERASE := true
#TW_USE_LEDS_HAPTICS := true
#TW_INCLUDE_REPACKTOOLS := true
#TW_Y_OFFSET := 89
#TW_H_OFFSET := -89
