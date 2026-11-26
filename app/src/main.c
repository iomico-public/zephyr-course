#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/sys/printk.h>
#include <drivers/led_sensor.h>

int main(void)
{
	const struct device *dev = DEVICE_DT_GET_ONE(custom_led_sensor);
	struct sensor_value val;
	bool invert = false;

	if (!device_is_ready(dev)) {
		printk("LED sensor device not ready\n");
		return 0;
	}

	while (1) {
		led_sensor_set_invert(dev, invert);

		sensor_sample_fetch(dev);
		k_msleep(1000);

		sensor_channel_get(dev, SENSOR_CHAN_ALL, &val);
		k_msleep(1000);

		invert = !invert;
	}

	return 0;
}
