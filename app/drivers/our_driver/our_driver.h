#ifndef APP_DRIVERS_OUR_DRIVER_H
#define APP_DRIVERS_OUR_DRIVER_H

#include <errno.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <stdint.h>

typedef int(*our_driver_set_temperature_offset_t)(const struct device *dev,
    int32_t offset_celsius);

struct our_driver_api {
    struct sensor_driver_api sensor_api;
    our_driver_set_temperature_offset_t set_temperature_offset;
};

static inline int our_driver_set_temperature_offset(const struct device *dev,
    int32_t offset_celsius) {
        const struct our_driver_api *api = (const struct our_driver_api*)dev->api;

        if(api->set_temperature_offset == NULL) {
            return -ENOTSUP;
        }

        return api->set_temperature_offset(dev, offset_celsius);
}

#endif // APP_DRIVERS_OUR_DRIVER_H