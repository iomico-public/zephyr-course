#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

#include "led_sensor.h"

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define LED_SENSOR_NODE DT_NODELABEL(led_sensor0)

#if !DT_NODE_HAS_STATUS(LED_SENSOR_NODE, okay)
#error "led_sensor0 node is not defined in devicetree"
#endif

static const struct device *const led_sensor = DEVICE_DT_GET(LED_SENSOR_NODE);

int main(void)
{
struct sensor_value value;
int32_t runtime_parameter = 1;

if (!device_is_ready(led_sensor)) {
LOG_ERR("LED sensor device is not ready");
return 0;
}

LOG_INF("LED sensor application started");

while (1) {
if (led_sensor_set_runtime_parameter(led_sensor, runtime_parameter) < 0) {
LOG_ERR("led_sensor_set_runtime_parameter failed");
return 0;
}

if (sensor_sample_fetch(led_sensor) < 0) {
LOG_ERR("sensor_sample_fetch failed");
return 0;
}

k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);

if (sensor_channel_get(led_sensor, SENSOR_CHAN_ALL, &value) < 0) {
LOG_ERR("sensor_channel_get failed");
return 0;
}

LOG_INF("main: sensor value after channel_get = %d", value.val1);

runtime_parameter++;

k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);
}

return 0;
}
