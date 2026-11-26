#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/shell/shell.h>
#include <drivers/led_sensor.h>

static const struct device *const led_dev = DEVICE_DT_GET_ONE(custom_led_sensor);

static int cmd_sensor_fetch(const struct shell *sh, size_t argc, char **argv)
{
	int ret;

	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	if (!device_is_ready(led_dev)) {
		shell_error(sh, "Device %s not ready", led_dev->name);
		return -ENODEV;
	}

	ret = sensor_sample_fetch(led_dev);
	if (ret < 0) {
		shell_error(sh, "sensor_sample_fetch failed (%d)", ret);
		return ret;
	}

	shell_print(sh, "Sample fetched (LED turned ON)");
	return 0;
}

static int cmd_sensor_read(const struct shell *sh, size_t argc, char **argv)
{
	struct sensor_value val;
	int ret;

	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	if (!device_is_ready(led_dev)) {
		shell_error(sh, "Device %s not ready", led_dev->name);
		return -ENODEV;
	}

	ret = sensor_channel_get(led_dev, SENSOR_CHAN_ALL, &val);
	if (ret < 0) {
		shell_error(sh, "sensor_channel_get failed (%d)", ret);
		return ret;
	}

	shell_print(sh, "Channel value: %d.%06d (LED turned OFF)", val.val1, val.val2);
	return 0;
}

static int cmd_sensor_info(const struct shell *sh, size_t argc, char **argv)
{
	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	shell_print(sh, "Device name: %s", led_dev->name);
	shell_print(sh, "Ready state: %s", device_is_ready(led_dev) ? "ready" : "not ready");
	return 0;
}

static int cmd_sensor_set(const struct shell *sh, size_t argc, char **argv)
{
	int err = 0;
	long val;
	int ret;

	if (argc < 2) {
		shell_error(sh, "Missing argument. Usage: sensor set <0|1>");
		return -EINVAL;
	}

	val = shell_strtol(argv[1], 10, &err);
	if (err != 0 || val < 0 || val > 1) {
		shell_error(sh, "Invalid value '%s': must be 0 or 1", argv[1]);
		return -EINVAL;
	}

	if (!device_is_ready(led_dev)) {
		shell_error(sh, "Device %s not ready", led_dev->name);
		return -ENODEV;
	}

	ret = led_sensor_set_invert(led_dev, (val == 1));
	if (ret < 0) {
		shell_error(sh, "led_sensor_set_invert failed (%d)", ret);
		return ret;
	}

	shell_print(sh, "LED invert set to %ld", val);
	return 0;
}

SHELL_STATIC_SUBCMD_SET_CREATE(sub_sensor,
	SHELL_CMD_ARG(fetch, NULL, "Fetch sample (turns LED ON)", cmd_sensor_fetch, 1, 0),
	SHELL_CMD_ARG(read, NULL, "Read channel value (turns LED OFF)", cmd_sensor_read, 1, 0),
	SHELL_CMD_ARG(info, NULL, "Print device name and ready state", cmd_sensor_info, 1, 0),
	SHELL_CMD_ARG(set, NULL, "Set LED polarity inversion <0|1>", cmd_sensor_set, 2, 0),
	SHELL_SUBCMD_SET_END
);

SHELL_CMD_REGISTER(sensor, &sub_sensor, "LED sensor commands", NULL);

int main(void)
{
	return 0;
}
