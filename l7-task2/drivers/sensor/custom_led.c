#define DT_DRV_COMPAT custom_led_sensor

#include <zephyr/kernel.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>
#include <custom_led.h>

LOG_MODULE_REGISTER(custom_led, CONFIG_SENSOR_LOG_LEVEL);

// Immutable hardware configuration (stored in ROM/Flash)
struct custom_led_config {
	struct gpio_dt_spec led_gpio;
};

// Task 2: Mutable runtime state (stored in RAM)
struct custom_led_data {
	uint8_t brightness_mode;
};

// Task 1: Fetch turns ON the LED
static int custom_led_sample_fetch(const struct device *dev, enum sensor_channel chan)
{
	ARG_UNUSED(chan);
	const struct custom_led_config *cfg = dev->config;

	return gpio_pin_set_dt(&cfg->led_gpio, 1);
}

// Task 1 & 2: Channel get turns OFF the LED and returns current runtime mode
static int custom_led_channel_get(const struct device *dev, enum sensor_channel chan,
				  struct sensor_value *val)
{
	ARG_UNUSED(chan);
	const struct custom_led_config *cfg = dev->config;
	const struct custom_led_data *data = dev->data;

	if (val != NULL) {
		val->val1 = data->brightness_mode;
		val->val2 = 0;
	}

	return gpio_pin_set_dt(&cfg->led_gpio, 0);
}

// Task 2: Custom extension API implementation
void custom_led_set_brightness_mode(const struct device *dev, uint8_t mode)
{
	struct custom_led_data *data = dev->data;

	data->brightness_mode = mode;
	LOG_INF("Brightness mode updated to: %u", data->brightness_mode);
}

// Sensor Driver API registration
static DEVICE_API(sensor, custom_led_api) = {
	.sample_fetch = custom_led_sample_fetch,
	.channel_get = custom_led_channel_get,
};

// Driver instance initialization
static int custom_led_init(const struct device *dev)
{
	const struct custom_led_config *cfg = dev->config;
	struct custom_led_data *data = dev->data;

	if (!gpio_is_ready_dt(&cfg->led_gpio)) {
		LOG_ERR("GPIO device not ready");
		return -ENODEV;
	}

	data->brightness_mode = 0;

	return gpio_pin_configure_dt(&cfg->led_gpio, GPIO_OUTPUT_INACTIVE);
}

//Devicetree instantiation macro binding both mutable data and immutable config
#define CUSTOM_LED_DEFINE(inst)                                                \
	static struct custom_led_data data_##inst;                             \
	static const struct custom_led_config cfg_##inst = {                   \
		.led_gpio = GPIO_DT_SPEC_INST_GET(inst, led_gpios),            \
	};                                                                     \
	DEVICE_DT_INST_DEFINE(inst, custom_led_init, NULL,                     \
			      &data_##inst, &cfg_##inst,                       \
			      POST_KERNEL, CONFIG_SENSOR_INIT_PRIORITY,        \
			      &custom_led_api);

DT_INST_FOREACH_STATUS_OKAY(CUSTOM_LED_DEFINE)
