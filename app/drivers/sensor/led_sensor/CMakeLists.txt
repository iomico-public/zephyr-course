zephyr_library()
zephyr_library_sources_ifdef(CONFIG_LED_SENSOR led_sensor.c)
