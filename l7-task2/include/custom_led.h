#ifndef CUSTOM_LED_H
#define CUSTOM_LED_H

#include <stdint.h>
#include <zephyr/device.h>

void custom_led_set_brightness_mode(const struct device *dev, uint8_t mode);

#endif

//CUSTOM LED_H