#include "zephyr/devicetree.h"
#include <stdint.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/logging/log.h>

#include "our_driver.h" 

#define DT_DRV_COMPAT our_driver

LOG_MODULE_REGISTER(our_driver, LOG_LEVEL_INF);

struct our_driver_data {
    int32_t sample_celsius;
    uint32_t fetch_count;
    int32_t temperature_offset_celsius;
};

static int set_temperature_offset_impl(const struct device *dev, int32_t offset_celsius) {
    struct our_driver_data *data = dev->data;
    data->temperature_offset_celsius = offset_celsius;
    LOG_INF("Temperature offset set to %d C", offset_celsius);
    return 0;
}

static int sample_fetch_my_impl(const struct device *dev, enum sensor_channel chan) {
    struct our_driver_data *data = dev->data;

    if(chan != SENSOR_CHAN_ALL && chan != SENSOR_CHAN_AMBIENT_TEMP) {
        return -ENOTSUP;
    }

    data->fetch_count++;
    data->sample_celsius = 20 + data->fetch_count + data->temperature_offset_celsius; // Simulate a changing temperature

    LOG_INF("Fetched sample: %d C", data->sample_celsius);
    return 0;
}

static int channel_get_my_impl(const struct device *dev, enum sensor_channel chan, struct sensor_value *val) {

    struct our_driver_data *data = dev->data;

    if(chan != SENSOR_CHAN_AMBIENT_TEMP) {
        return -ENOTSUP;
    }

    val->val1 = data->sample_celsius;
    val->val2 = 0;

    LOG_INF("Channel get: %d.%06d C", val->val1, val->val2);    
    return 0;
}

static const struct our_driver_api api_denis = {
    .sensor_api = {
        .sample_fetch = sample_fetch_my_impl,
        .channel_get = channel_get_my_impl,
    },
    .set_temperature_offset = set_temperature_offset_impl,
};


// init fn
static int init(const struct device *dev) {
    LOG_INF("Device initialized!");
    return 0;
}

#define DEV_INST(inst) \
    static struct our_driver_data our_driver_data_##inst; \
    DEVICE_DT_INST_DEFINE(inst, init, NULL, &our_driver_data_##inst, NULL, POST_KERNEL, 80, &api_denis);

DT_INST_FOREACH_STATUS_OKAY(DEV_INST)