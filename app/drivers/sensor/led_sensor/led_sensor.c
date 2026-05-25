#include <errno.h>

#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>
#include <zephyr/sys/util.h>

#include "led_sensor.h"

LOG_MODULE_REGISTER(led_sensor, LOG_LEVEL_INF);

#define DT_DRV_COMPAT gorral_led_sensor

struct led_sensor_config {
struct gpio_dt_spec led;
};

struct led_sensor_data {
bool led_is_on;
int32_t runtime_parameter;
};

static int led_sensor_sample_fetch(const struct device *dev,
   enum sensor_channel chan)
{
const struct led_sensor_config *config = dev->config;
struct led_sensor_data *data = dev->data;
int ret;

ARG_UNUSED(chan);

ret = gpio_pin_set_dt(&config->led, 1);
if (ret < 0) {
return ret;
}

data->led_is_on = true;
LOG_INF("sensor_sample_fetch: LED ON, runtime_parameter=%d",
data->runtime_parameter);

return 0;
}

static int led_sensor_channel_get(const struct device *dev,
  enum sensor_channel chan,
  struct sensor_value *val)
{
const struct led_sensor_config *config = dev->config;
struct led_sensor_data *data = dev->data;
int ret;

if (chan != SENSOR_CHAN_ALL) {
return -ENOTSUP;
}

ret = gpio_pin_set_dt(&config->led, 0);
if (ret < 0) {
return ret;
}

data->led_is_on = false;

if (val != NULL) {
val->val1 = data->runtime_parameter;
val->val2 = 0;
}

LOG_INF("sensor_channel_get: LED OFF, runtime_parameter=%d",
data->runtime_parameter);

return 0;
}

static int led_sensor_set_runtime_parameter_impl(const struct device *dev,
 int32_t runtime_parameter)
{
struct led_sensor_data *data = dev->data;

data->runtime_parameter = runtime_parameter;

LOG_INF("custom API: runtime_parameter changed to %d",
data->runtime_parameter);

return 0;
}

static int led_sensor_init(const struct device *dev)
{
const struct led_sensor_config *config = dev->config;
struct led_sensor_data *data = dev->data;

if (!gpio_is_ready_dt(&config->led)) {
LOG_ERR("LED GPIO device is not ready");
return -ENODEV;
}

data->runtime_parameter = 0;
data->led_is_on = false;

return gpio_pin_configure_dt(&config->led, GPIO_OUTPUT_INACTIVE);
}

static const struct led_sensor_driver_api led_sensor_api = {
.sensor_api = {
.sample_fetch = led_sensor_sample_fetch,
.channel_get = led_sensor_channel_get,
},
.set_runtime_parameter = led_sensor_set_runtime_parameter_impl,
};

#define LED_SENSOR_DEFINE(inst)\
static struct led_sensor_data led_sensor_data_##inst;\
\
static const struct led_sensor_config led_sensor_config_##inst = {\
.led = GPIO_DT_SPEC_INST_GET(inst, led_gpios),\
};\
\
DEVICE_DT_INST_DEFINE(inst,\
      led_sensor_init,\
      NULL,\
      &led_sensor_data_##inst,\
      &led_sensor_config_##inst,\
      POST_KERNEL,\
      CONFIG_SENSOR_INIT_PRIORITY,\
      &led_sensor_api);

DT_INST_FOREACH_STATUS_OKAY(LED_SENSOR_DEFINE)
