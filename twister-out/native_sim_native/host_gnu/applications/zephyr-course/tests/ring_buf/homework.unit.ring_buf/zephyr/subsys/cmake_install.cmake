# Install script for directory: /home/lorsi/zephyrproject/deps/zephyr/subsys

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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/canbus/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/debug/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/fb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/fs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/gnss/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/instrumentation/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/ipc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/kvss/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/logging/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/mem_mgmt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/mgmt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/modbus/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/pm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/pmci/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/portability/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/random/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/rtio/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/sd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/stats/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/storage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/task_wdt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/testsuite/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/tracing/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/lorsi/zephyrproject/applications/zephyr-course/twister-out/native_sim_native/host_gnu/applications/zephyr-course/tests/ring_buf/homework.unit.ring_buf/zephyr/subsys/usb/cmake_install.cmake")
endif()

