cmake_minimum_required(VERSION 3.20.0)

list(APPEND DTS_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/drivers)

find_package(Zephyr REQUIRED)
project(my_zephyr_app)

add_subdirectory(drivers/sarche_driver)
target_sources(app PRIVATE src/main.cpp)
