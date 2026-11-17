# Install script for directory: /home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyrproject/zephyr

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/arch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/lib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/soc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/boards/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/drivers/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/acpica/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/cmsis/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/cmsis-dsp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/cmsis-nn/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/cmsis_6/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/dhara/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/fatfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/adi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_afbr/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_ambiq/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/atmel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_bouffalolab/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_espressif/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_ethos_u/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_gigadevice/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_infineon/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_intel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_microchip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_nordic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/nuvoton/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_nxp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/openisa/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/quicklogic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_realtek/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_renesas/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_rpi_pico/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_sifli/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_silabs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_st/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_stm32/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_tdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_telink/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/ti/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_wch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hal_wurthelektronik/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/xtensa/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/hostap/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/liblc3/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/libmctp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/libmetal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/libsbc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/littlefs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/lora-basics-modem/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/loramac-node/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/lvgl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/mbedtls/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/mcuboot/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/mipi-sys-t/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/nanopb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/nrf_wifi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/open-amp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/openthread/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/percepio/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/picolibc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/segger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/trusted-firmware-a/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/trusted-firmware-m/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/uoscore-uedhoc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/zcbor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/xenlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/modules/nrf_hw_models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/kernel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/cmake/flash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/cmake/usage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/cmake/reports/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/mirafra/Girish/GITHUB/Zephyr_Workspace/zephyr-course-stm32-c562re/twister-out/native_sim_native/host_gnu/zephyr-course-stm32-c562re/tests/ring_buf/homework.unit.ring_buf/zephyr/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
