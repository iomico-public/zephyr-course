#ifndef ZEPHYR_INCLUDE_DRIVERS_LED_SENSOR_H_
#define ZEPHYR_INCLUDE_DRIVERS_LED_SENSOR_H_

#include <stdbool.h>
#include <zephyr/device.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Set LED output polarity inversion in the driver dynamic data struct.
 *
 * @param dev Pointer to the led_sensor device instance.
 * @param invert True to invert LED logic, false for normal logic.
 * @return 0 on success, negative errno on failure.
 */
int led_sensor_set_invert(const struct device *dev, bool invert);

#ifdef __cplusplus
}
#endif

#endif /* ZEPHYR_INCLUDE_DRIVERS_LED_SENSOR_H_ */
