USE_CAMERA_STUB := true

BOARD_VENDOR := xiaomi

COMMON_PATH := device/xiaomi/msm8974-common

OUT := out/target/product/cancro

TARGET_BOARD_KERNEL_HEADERS := $(COMMON_PATH)/kernel-headers


TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE  := true

QCOM_BOARD_PLATFORMS  := msm8974
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait

# Flags
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

BOARD_KERNEL_SEPARATED_DT :=  true

ADD_RADIO_FILES ?= true

TARGET_BOOTIMG_SIGNED := false
BOARD_KERNEL_CMDLINE := ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_DTBTOOL_ARGS 	 := -2
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --dt $(OUT)/dt.img 
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000



# Flags
COMMON_GLOBAL_CFLAGS +=  -DQCOM_HARDWARE -DQCOM_BSP -DQTI_BSP
COMMON_GLOBAL_CPPFLAGS += -DQCOM_HARDWARE -DQCOM_BSP -DQTI_BSP

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#USE_SENSOR_MULTI_HAL := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_PCM_IOCTL_ENABLED := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_USBAUDIO := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
BOARD_FORTEMEDIA_QDSP_ENABLED := true
AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER := true
#QCOM_LISTEN_FEATURE := true
#AUDIO_FEATURE_ENABLED_LISTEN := true
DOLBY_DAP := true
DOLBY_DDP := true
DOLBY_UDC:= true
DOLBY_UDC_MULTICHANNEL:= true
DOLBY_UDC_STREAMING_HLS:= true
BOARD_OMXCODEC_FFMPEG := true
AUDIO_FEATURE_DYNAMIC_MIXER_PATHS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(COMMON_PATH)/init/init_cancro.cpp

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# Simple time service client
BOARD_USES_QC_TIME_SERVICES := true

# Graphics
BOARD_EGL_CFG := $(COMMON_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE:= false
TARGET_USES_POST_PROCESSING := true
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000


# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Wlan
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
TARGET_USES_WCNSS_CTRL           := true

# No old RPC for prop
TARGET_NO_RPC := true

# GPS HAL lives here
TARGET_GPS_HAL_PATH := $(COMMON_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Use HW crypto for ODE
TARGET_HW_DISK_ENCRYPTION := false

# CM Hardware
BOARD_HARDWARE_CLASS += $(COMMON_PATH)/cmhw


# Enable CNE
#BOARD_USES_QCNE := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1306003000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE := 16777216
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_SMALL_USERDATAIMAGE_PARTITION_SIZE := 536870912

# Recovery
TARGET_RECOVERY_FSTAB            := $(COMMON_PATH)/rootdir/root/recovery_fstab.qcom
RECOVERY_FSTAB_VERSION           := 2
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

BOARD_HAS_NO_SELECT_BUTTON := true

FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true
