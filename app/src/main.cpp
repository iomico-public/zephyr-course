#include <zephyr/drivers/gpio.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>
#include <zephyr/drivers/sensor.h>
#include <sarche_driver.h>


#define SLEEP_TIME_MS 1000

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

int main(void)
{
	const struct device *led_sensor = DEVICE_DT_GET_ANY(sarche_driver);

	if (!device_is_ready(led_sensor)) {
		LOG_ERR("LED sensor device not ready");
		return 0;
	}

	LOG_INF("LED sensor device ready");

	int counter = 0;

	while (1) {
		sarche_set_user_param(led_sensor, counter++);

		LOG_INF("Turning LED ON...");
		sensor_sample_fetch(led_sensor);
		k_msleep(SLEEP_TIME_MS);

		
		struct sensor_value val = {0, 0};
		LOG_INF("Turning LED OFF...");
		sensor_channel_get(led_sensor, SENSOR_CHAN_LIGHT, &val);
		k_msleep(SLEEP_TIME_MS);
	}

	return 0;
}
