#include <zephyr/shell/shell.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/device.h>

static const struct device *get_led_sensor(void)
{
    return DEVICE_DT_GET_ANY(iomico_led_sensor);
}

/* --- fetch: enciende el LED --- */
static int cmd_sensor_fetch(const struct shell *sh, size_t argc, char **argv)
{
    const struct device *dev = get_led_sensor();

    if (!device_is_ready(dev)) {
        shell_error(sh, "Sensor no disponible");
        return -ENODEV;
    }

    int ret = sensor_sample_fetch(dev);
    if (ret) {
        shell_error(sh, "fetch failed: %d", ret);
        return ret;
    }

    shell_print(sh, "fetch OK - LED encendido");
    return 0;
}

/* --- read: apaga el LED e imprime resultado --- */
static int cmd_sensor_read(const struct shell *sh, size_t argc, char **argv)
{
    const struct device *dev = get_led_sensor();

    if (!device_is_ready(dev)) {
        shell_error(sh, "Sensor no disponible");
        return -ENODEV;
    }

    struct sensor_value val;
    int ret = sensor_channel_get(dev, SENSOR_CHAN_ALL, &val);
    if (ret) {
        shell_error(sh, "channel_get failed: %d", ret);
        return ret;
    }

    shell_print(sh, "read OK - LED apagado, val=%d.%06d", val.val1, val.val2);
    return 0;
}

/* --- info: imprime nombre y estado del device --- */
static int cmd_sensor_info(const struct shell *sh, size_t argc, char **argv)
{
    const struct device *dev = get_led_sensor();

    shell_print(sh, "Device name : %s", dev->name);
    shell_print(sh, "Device ready: %s", device_is_ready(dev) ? "YES" : "NO");
    return 0;
}

/* --- registro de subcomandos y root command --- */
SHELL_STATIC_SUBCMD_SET_CREATE(sub_sensor,
    SHELL_CMD(fetch, NULL, "Fetch sensor sample (LED ON)", cmd_sensor_fetch),
    SHELL_CMD(read,  NULL, "Read sensor channel (LED OFF)", cmd_sensor_read),
    SHELL_CMD(info,  NULL, "Print device info", cmd_sensor_info),
    SHELL_SUBCMD_SET_END
);

SHELL_CMD_REGISTER(sensor, &sub_sensor, "LED sensor commands", NULL);