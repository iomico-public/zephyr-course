#define DT_DRV_COMPAT custom_led_sensor

#include <zephyr/kernel.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(custom_led_t1, CONFIG_SENSOR_LOG_LEVEL);

// Immutable config
struct custom_led_config {
    struct gpio_dt_spec led_gpio;
};

// Fetch turns ON the LED
static int custom_led_sample_fetch(const struct device *dev, enum sensor_channel chan) {
    const struct custom_led_config *cfg = dev->config;
    gpio_pin_set_dt(&cfg->led_gpio, 1);
    return 0;
}

// Get turns OFF the LED 
static int custom_led_channel_get(const struct device *dev, enum sensor_channel chan, struct sensor_value *val) {
    const struct custom_led_config *cfg = dev->config;
    gpio_pin_set_dt(&cfg->led_gpio, 0);
    return 0;
}

// Standard API Registration
static DEVICE_API(sensor, custom_led_api) = {
    .sample_fetch = custom_led_sample_fetch,
    .channel_get = custom_led_channel_get,
};

static int custom_led_init(const struct device *dev) {
    const struct custom_led_config *cfg = dev->config;
    if (!gpio_is_ready_dt(&cfg->led_gpio)) {
        return -ENODEV;
    }
    return gpio_pin_configure_dt(&cfg->led_gpio, GPIO_OUTPUT_INACTIVE);
}

//Task 1 needs no mutable data, passing NULL
#define CUSTOM_LED_DEFINE(inst) \
    static const struct custom_led_config cfg_##inst = { \
        .led_gpio = GPIO_DT_SPEC_INST_GET(inst, led_gpios), \
    }; \
    DEVICE_DT_INST_DEFINE(inst, custom_led_init, NULL, \
                          NULL, &cfg_##inst, \
                          POST_KERNEL, CONFIG_SENSOR_INIT_PRIORITY, \
                          &custom_led_api);

DT_INST_FOREACH_STATUS_OKAY(CUSTOM_LED_DEFINE)