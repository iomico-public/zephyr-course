#
# Copyright 2024 NXP
#
# SPDX-License-Identifier: Apache-2.0
#
cmake_minimum_required(VERSION 3.20.0)

# Point BOARD_ROOT to the parent folder containing 'boards/' BEFORE find_package
list(APPEND BOARD_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/..)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(custom_board_blink)

target_sources(app PRIVATE src/main.c)

