#
# Copyright 2014 The Android Open Source Project
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

 LOCAL_PATH := $(call my-dir)
# 
# 
# #----------------------------------------------------------------------
# # Compile Linux Kernel
# #----------------------------------------------------------------------
 
 TARGET_KERNEL_SOURCE := kernel/xiaomi/cancro

 ifeq ($(TARGET_KERNEL_CONFIG),)
 ifeq ($(TARGET_BUILD_VARIANT),eng)
     TARGET_KERNEL_CONFIG := cancro_user_defconfig
 else
     TARGET_KERNEL_CONFIG := cancro_user_defconfig
 endif
 endif

 TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
 
 include kernel/xiaomi/cancro/AndroidKernel.mk
 
 $(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP)
 	$(transform-prebuilt-to-target)

# 
# #----------------------------------------------------------------------
# # extra images
# #----------------------------------------------------------------------
 include build/core/generate_extra_images.mk

# # include the non-open-source counterpart to this file
-include vendor/xiaomi/cancro/AndroidBoardVendor.mk
