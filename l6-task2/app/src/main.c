#include <stdlib.h>
#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/shell/shell.h>
#include <custom_led.h>

/* Shell command handler: led_mode <value> */
static int cmd_set_mode(const struct shell *sh, size_t argc, char **argv)
{
	ARG_UNUSED(argc);
	const struct device *dev = DEVICE_DT_GET_ANY(custom_led_sensor);

	if (!device_is_ready(dev)) {
		shell_error(sh, "Custom LED sensor device not ready");
		return -ENODEV;
	}

	uint8_t mode = (uint8_t)atoi(argv[1]);

	custom_led_set_brightness_mode(dev, mode);
	shell_print(sh, "Stored brightness mode updated to: %u", mode);

	return 0;
}

SHELL_CMD_ARG_REGISTER(led_mode, NULL, "Set LED brightness mode (e.g. led_mode 5)",
		       cmd_set_mode, 2, 0);

int main(void)
{
	const struct device *dev = DEVICE_DT_GET_ANY(custom_led_sensor);

	if (!device_is_ready(dev)) {
		printk("Custom LED sensor device not ready\n");
		return -ENODEV;
	}

	/* Initial default mode */
	custom_led_set_brightness_mode(dev, 5);

	while (1) {
		struct sensor_value val;

		/* Turn ON LED */
		sensor_sample_fetch(dev);
		k_msleep(500);

		/* Turn OFF LED and read current mode */
		sensor_channel_get(dev, SENSOR_CHAN_ALL, &val);

		/* Scale off-time by stored mode (minimum 200ms) */
		uint32_t delay_ms = (val.val1 > 0) ? (val.val1 * 200) : 200;
		k_msleep(delay_ms);
	}

	return 0;
}
