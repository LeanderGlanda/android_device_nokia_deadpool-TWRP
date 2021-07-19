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
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_SUPPORTS_64_BIT_APPS := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_serial_dm,0x78B0000 androidboot.usbconfigfs=true loop.max_part=7 buildvariant=user
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_OFFSET := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x80000100
BOARD_RAMDISK_OFFSET     := 0x81000000
# BOARD_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := device/nokia/deadpool/prebuilt/kernel


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

# A/B device flags
TARGET_NO_KERNEL := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_UPDATER := true

# Encryption
# PLATFORM_VERSION := 11
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# TWRP specific build flags
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
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
# TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888" (I'm not sure which to use)
TARGET_RECOVER_PIXEL_FORMAT := RGBA
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true
# RECOVERY_VARIANT := twrp

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Extras
#BOARD_SUPPRESS_SECURE_ERASE := true
#TW_USE_LEDS_HAPTICS := true
#TW_INCLUDE_REPACKTOOLS := true
#TW_Y_OFFSET := 89
#TW_H_OFFSET := -89
