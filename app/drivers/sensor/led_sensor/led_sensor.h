#ifndef LED_SENSOR_H
#define LED_SENSOR_H

#include <errno.h>
#include <stdint.h>

#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>

typedef int (*led_sensor_set_runtime_parameter_t)(const struct device *dev,
  int32_t runtime_parameter);

struct led_sensor_driver_api {
struct sensor_driver_api sensor_api;
led_sensor_set_runtime_parameter_t set_runtime_parameter;
};

static inline int led_sensor_set_runtime_parameter(const struct device *dev,
   int32_t runtime_parameter)
{
const struct led_sensor_driver_api *api = dev->api;

if (api->set_runtime_parameter == NULL) {
return -ENOSYS;
}

return api->set_runtime_parameter(dev, runtime_parameter);
}

#endif /* LED_SENSOR_H */
