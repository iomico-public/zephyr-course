cmake_minimum_required(VERSION 3.20.0)

set(BOARD_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

find_package(Zephyr REQUIRED)
project(my_zephyr_app)
target_sources(app PRIVATE
    src/main.cpp
    src/sensor_shell.c
)
target_include_directories(app PRIVATE modules/led_sensor_module/include)


#cmake_minimum_required(VERSION 3.20.0)

#find_package(Zephyr REQUIRED)
#project(my_zephyr_app)

#target_sources(app PRIVATE src/main.cpp)
