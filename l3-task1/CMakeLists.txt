cmake_minimum_required(VERSION 4.20.0)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(l3_task1 LANGUAGES C)

zephyr_library_amend_sysbuild(KCONFIG /home/spamboii/zephyr-course-fundamentals/l3-task1/Kconfig)

target_sources(app PRIVATE src/main.c)