#include <zephyr/drivers/sensor.h>
#include <zephyr/logging/log.h>
#include <zephyr/drivers/gpio.h>
#include "sarche_driver.h"

#define DT_DRV_COMPAT sarche_driver

LOG_MODULE_REGISTER(sarche_driver, LOG_LEVEL_INF);


#define LED_NODE DT_ALIAS(app_led)

struct sarche_sensor_data {
	const struct device *gpio_dev;
	gpio_pin_t pin;
	int user_param;
};

struct sarche_sensor_config {
	struct gpio_dt_spec led_gpio;
};


static int sarche_driver_sample_fetch(const struct device *dev, enum sensor_channel channel)
{
    LOG_INF("Hello from sarche driver sample fetch %d", channel);

    struct sarche_sensor_data *data = dev->data;
    const struct sarche_sensor_config *config = dev->config;
    int ret;
    ret = gpio_pin_set_dt(&config->led_gpio, 1);
	if (ret) {
		LOG_ERR("Failed to turn LED on: %d", ret);
		return ret;
	}
    LOG_INF("LED state ON");
    return 0;   

}

static int sarche_driver_channel_get(const struct device *dev, enum sensor_channel channel, struct sensor_value* val)
{
    LOG_INF("Hello from sarche driver channel %d", channel);
    const struct sarche_sensor_config *config = dev->config;
    int ret;
    ret = gpio_pin_set_dt(&config->led_gpio, 0);
	if (ret) {
		LOG_ERR("Failed to turn LED off: %d", ret);
		return ret;
	}
    LOG_INF("LED state OFF");
    val->val1 = 42; // Example value
    val->val2 = 0; // Example value
    return 0;   

}

static int sarche_driver_init(const struct device *dev)
{
	struct sarche_sensor_data *data = dev->data;
	const struct sarche_sensor_config *config = dev->config;
	int ret;

	// Get the GPIO device 
	if (!device_is_ready(config->led_gpio.port)) {
		LOG_ERR("GPIO device not ready");
		return -ENODEV;
	}

	// Configure the GPIO pin
	ret = gpio_pin_configure_dt(&config->led_gpio, GPIO_OUTPUT_INACTIVE);
	if (ret) {
		LOG_ERR("Failed to configure GPIO pin: %d", ret);
		return ret;
	}

	data->gpio_dev = config->led_gpio.port;
	data->pin = config->led_gpio.pin;

	LOG_INF("Device initialized");
	return 0;
}

static int sarche_driver_set_user_param(const struct device *dev, int value)
{
	struct sarche_sensor_data *data = dev->data;
	data->user_param = value;
	LOG_INF("user_param set to %d", data->user_param);
	return 0;
}

static const struct sarche_driver_api sarche_sensor_driver_api = {
	.sensor = {
		.sample_fetch = sarche_driver_sample_fetch,
		.channel_get = sarche_driver_channel_get,
	},
	.set_user_param = sarche_driver_set_user_param,
};



#define SARCHE_SENSOR_INIT(inst)                                \
    static struct sarche_sensor_data sarche_sensor_data_##inst; \
    static const struct sarche_sensor_config sarche_sensor_config_##inst = { \
        .led_gpio = GPIO_DT_SPEC_GET(DT_DRV_INST(inst), led_gpios), \
    }; \
    DEVICE_DT_INST_DEFINE(inst,                                  \
                          sarche_driver_init,                   \
                          NULL,                                 \
                          &sarche_sensor_data_##inst,           \
                          &sarche_sensor_config_##inst,         \
                          POST_KERNEL,                          \
                          CONFIG_KERNEL_INIT_PRIORITY_DEVICE,   \
                          &sarche_sensor_driver_api);

DT_INST_FOREACH_STATUS_OKAY(SARCHE_SENSOR_INIT)