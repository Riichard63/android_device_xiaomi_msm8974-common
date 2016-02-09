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
 ifeq ($(KERNEL_DEFCONFIG),)
 ifeq ($(TARGET_BUILD_VARIANT),eng)
     KERNEL_DEFCONFIG := cyanogen_cancro_defconfig
 else
     KERNEL_DEFCONFIG := cyanogen_cancro_defconfig
 endif
 endif
 
 include kernel/AndroidKernel.mk
 
 $(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP)
 	$(transform-prebuilt-to-target)
 INSTALLED_KERNEL_TARGET := out/target/product/cancro/obj/KERNEL_OBJ/arch/arm/boot/zImage

# 
# #----------------------------------------------------------------------
# # extra images
# #----------------------------------------------------------------------
 include vendor/qcom/build/tasks/generate_extra_images.mk

# # include the non-open-source counterpart to this file
-include vendor/xiaomi/cancro/AndroidBoardVendor.mk
