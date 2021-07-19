# File originally from https://github.com/RaghuVarma331/android_device_nokia_SLD_sprout-TWRP
# (modified)

ifneq ($(filter deadpool,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
