#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/shell/shell.h>

static const struct device *const led_sensor_dev = DEVICE_DT_GET_ANY(custom_led_sensor);

// Subcommand: sensor fetch -> calls sensor_sample_fetch() (turns LED ON)
static int cmd_sensor_fetch(const struct shell *sh, size_t argc, char **argv)
{
	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	if (!device_is_ready(led_sensor_dev)) {
		shell_error(sh, "Sensor device is not ready");
		return -ENODEV;
	}

	int ret = sensor_sample_fetch(led_sensor_dev);
	if (ret < 0) {
		shell_error(sh, "sensor_sample_fetch failed (%d)", ret);
		return ret;
	}

	shell_print(sh, "Sample fetched (LED ON)");
	return 0;
}

// Subcommand: sensor read -> calls sensor_channel_get() and prints result (turns LED OFF)
static int cmd_sensor_read(const struct shell *sh, size_t argc, char **argv)
{
	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	if (!device_is_ready(led_sensor_dev)) {
		shell_error(sh, "Sensor device is not ready");
		return -ENODEV;
	}

	struct sensor_value val;
	int ret = sensor_channel_get(led_sensor_dev, SENSOR_CHAN_ALL, &val);
	if (ret < 0) {
		shell_error(sh, "sensor_channel_get failed (%d)", ret);
		return ret;
	}

	shell_print(sh, "Channel read (LED OFF) -> val1=%d, val2=%d", val.val1, val.val2);
	return 0;
}

// Subcommand: sensor info -> prints device name and ready state
static int cmd_sensor_info(const struct shell *sh, size_t argc, char **argv)
{
	ARG_UNUSED(argc);
	ARG_UNUSED(argv);

	bool ready = device_is_ready(led_sensor_dev);
	const char *name = (led_sensor_dev->name != NULL) ? led_sensor_dev->name : "unknown";

	shell_print(sh, "Device name: %s", name);
	shell_print(sh, "Ready state: %s", ready ? "READY" : "NOT READY");
	return 0;
}

//Register static subcommands under root command "sensor"
SHELL_STATIC_SUBCMD_SET_CREATE(sub_sensor,
	SHELL_CMD(fetch, NULL, "Fetch sensor sample (turns LED ON)", cmd_sensor_fetch),
	SHELL_CMD(read, NULL, "Read sensor channel (turns LED OFF)", cmd_sensor_read),
	SHELL_CMD(info, NULL, "Show device name and ready state", cmd_sensor_info),
	SHELL_SUBCMD_SET_END
);

SHELL_CMD_REGISTER(sensor, &sub_sensor, "Custom LED sensor commands", NULL);

int main(void)
{
	if (!device_is_ready(led_sensor_dev)) {
		printk("Custom LED sensor device not ready\n");
		return -ENODEV;
	}

	return 0;
}
