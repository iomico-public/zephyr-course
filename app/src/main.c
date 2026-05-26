#include <errno.h>
#include <stdlib.h>

#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>
#include <zephyr/shell/shell.h>

#include "led_sensor.h"

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define LED_SENSOR_NODE DT_NODELABEL(led_sensor0)

#define SENSOR_SET_MIN_VALUE 0
#define SENSOR_SET_MAX_VALUE 100

#if !DT_NODE_HAS_STATUS(LED_SENSOR_NODE, okay)
#error "led_sensor0 node is not defined in devicetree"
#endif

static const struct device *const led_sensor = DEVICE_DT_GET(LED_SENSOR_NODE);

static int cmd_sensor_fetch(const struct shell *sh, size_t argc, char **argv)
{
int ret;

ARG_UNUSED(argc);
ARG_UNUSED(argv);

if (!device_is_ready(led_sensor)) {
shell_error(sh, "LED sensor device is not ready");
return -ENODEV;
}

ret = sensor_sample_fetch(led_sensor);
if (ret < 0) {
shell_error(sh, "sensor_sample_fetch failed: %d", ret);
return ret;
}

shell_print(sh, "sensor_sample_fetch executed: LED ON");

return 0;
}

static int cmd_sensor_read(const struct shell *sh, size_t argc, char **argv)
{
struct sensor_value value;
int ret;

ARG_UNUSED(argc);
ARG_UNUSED(argv);

if (!device_is_ready(led_sensor)) {
shell_error(sh, "LED sensor device is not ready");
return -ENODEV;
}

ret = sensor_channel_get(led_sensor, SENSOR_CHAN_ALL, &value);
if (ret < 0) {
shell_error(sh, "sensor_channel_get failed: %d", ret);
return ret;
}

shell_print(sh, "sensor_channel_get executed: LED OFF");
shell_print(sh, "sensor value: val1=%d, val2=%d", value.val1, value.val2);

return 0;
}

static int cmd_sensor_info(const struct shell *sh, size_t argc, char **argv)
{
ARG_UNUSED(argc);
ARG_UNUSED(argv);

shell_print(sh, "device name: %s", led_sensor->name);
shell_print(sh, "ready state: %s", device_is_ready(led_sensor) ? "ready" : "not ready");

return 0;
}

static int cmd_sensor_set(const struct shell *sh, size_t argc, char **argv)
{
char *endptr;
long value;
int ret;

if (argc < 2) {
shell_error(sh, "missing value");
shell_error(sh, "usage: sensor set <%d-%d>",
    SENSOR_SET_MIN_VALUE, SENSOR_SET_MAX_VALUE);
return -EINVAL;
}

errno = 0;
value = strtol(argv[1], &endptr, 10);

if ((errno != 0) || (*endptr != '\0')) {
shell_error(sh, "invalid value: %s", argv[1]);
return -EINVAL;
}

if ((value < SENSOR_SET_MIN_VALUE) || (value > SENSOR_SET_MAX_VALUE)) {
shell_error(sh, "value out of range: %ld", value);
shell_error(sh, "allowed range: %d-%d",
    SENSOR_SET_MIN_VALUE, SENSOR_SET_MAX_VALUE);
return -ERANGE;
}

if (!device_is_ready(led_sensor)) {
shell_error(sh, "LED sensor device is not ready");
return -ENODEV;
}

ret = led_sensor_set_runtime_parameter(led_sensor, (int32_t)value);
if (ret < 0) {
shell_error(sh, "led_sensor_set_runtime_parameter failed: %d", ret);
return ret;
}

shell_print(sh, "runtime parameter set to %ld", value);

return 0;
}

SHELL_STATIC_SUBCMD_SET_CREATE(sensor_subcommands,
SHELL_CMD(fetch, NULL, "Call sensor_sample_fetch() and turn LED on.", cmd_sensor_fetch),
SHELL_CMD(read, NULL, "Call sensor_channel_get() and turn LED off.", cmd_sensor_read),
SHELL_CMD(info, NULL, "Print sensor device name and ready state.", cmd_sensor_info),
SHELL_CMD_ARG(set, NULL, "Set runtime parameter. Usage: sensor set <0-100>",
      cmd_sensor_set, 2, 0),
SHELL_SUBCMD_SET_END
);

SHELL_CMD_REGISTER(sensor, &sensor_subcommands, "LED sensor shell commands", NULL);

int main(void)
{
if (!device_is_ready(led_sensor)) {
LOG_ERR("LED sensor device is not ready");
return 0;
}

LOG_INF("LED sensor shell application started");
LOG_INF("Try shell commands: sensor info, sensor fetch, sensor read, sensor set <value>");

return 0;
}
