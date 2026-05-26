#include "zephyr/device.h"
#include "zephyr/drivers/sensor.h"
#include "zephyr/toolchain.h"
#include <stdio.h>
#include <sys/errno.h>
#include <zephyr/shell/shell.h>

#include "our_driver.h"

#define TEMP_OFFSET_MIN (-20)
#define TEMP_OFFSET_MAX (100)

static const struct device *get_sensor_dev(const struct shell* sh, const char* name){
    const struct device *dev = shell_device_get_binding(name);

    if(!dev) {
        shell_error(sh, "Could not find device %s", name);
        return NULL;
    }

    if(!device_is_ready(dev)) {
        shell_error(sh, "Device %s is not ready", name);
        return NULL;
    }
    return dev;
}

static int cmd_sensor_fetch(const struct shell *sh, int argc, char **argv){
    ARG_UNUSED(argc);

    const struct device *dev = get_sensor_dev(sh, argv[1]);
    if(!dev) {
        return -ENODEV;
    }

    int ret = sensor_sample_fetch(dev);
    if(ret != 0) {
        shell_error(sh, "sensor_sample_fetch failed: %d", ret);
        return ret;
    }

    shell_print(sh, "Fetched sample from %s", dev->name);
    return 0;
}

static int cmd_sensor_read(const struct shell* sh, int argc, char **argv){
    ARG_UNUSED(argc);

    const struct device* dev = get_sensor_dev(sh, argv[1]);
    if(!dev) {
        return -ENODEV;
    }

    struct sensor_value val;
    int ret = sensor_channel_get(dev, SENSOR_CHAN_AMBIENT_TEMP, &val);
    if(ret != 0){
        shell_error(sh, "sensor_channel_get failed: %d", ret);
        return ret;
    }
    
    shell_print(sh, "Ambient temp: %d.%6d C", val.val1, val.val2);
    return 0;
}

static int cmd_sensor_info(const struct shell* sh, int argc, char** argv){
    ARG_UNUSED(argc);

    const struct device* dev = get_sensor_dev(sh, argv[1]);
    if(!dev) {
        return -ENODEV;
    }

    shell_print(sh, "Device: %s", dev->name);
    shell_print(sh, "Ready: yes");
    shell_print(sh, "Channel supported by this driver: ambient_temp");
    return 0;
}

static int cmd_sensor_offset(const struct shell *sh, int argc, char **argv){
    ARG_UNUSED(argc);

    const struct device* dev = get_sensor_dev(sh, argv[1]);
    if(!dev){
        return -ENODEV;
    }

    char* end;
    long offset = strtol(argv[2], &end, 10);
    if(*end != '\0'){
        shell_error(sh, "Invalid offset value: '%s' (must be an integer)", argv[2]);
        return -EINVAL;
    }

    if(offset < TEMP_OFFSET_MIN || offset > TEMP_OFFSET_MAX) {
        shell_error(sh, "offset %ld out of range [%d, %d]", offset, TEMP_OFFSET_MIN, TEMP_OFFSET_MAX);
        return -EINVAL;
    }

    int ret = our_driver_set_temperature_offset(dev, (int32_t)offset);
    if(ret != 0) {
        shell_error(sh, "set_temperature_offset failed: %d", ret);
        return ret;
    }

    shell_print(sh, "Temperature offset set to %ld C on %s", offset, dev->name);
    return 0;
}

SHELL_STATIC_SUBCMD_SET_CREATE(sensor_subcmd, 
    SHELL_CMD_ARG(fetch, NULL, "fetch <device>: call sensor_sample_fetch()", cmd_sensor_fetch, 2, 0),
    SHELL_CMD_ARG(read, NULL, "read <device>: call sensor_channel_get()", cmd_sensor_read, 2, 0),
    SHELL_CMD_ARG(info, NULL, "info <device>: print basic device info", cmd_sensor_info, 2, 0),
    SHELL_CMD_ARG(offset, NULL, "offset <device> <value_c> : set temperature offset [-20...100]", cmd_sensor_offset, 3, 0),
    SHELL_SUBCMD_SET_END

);

SHELL_CMD_REGISTER(sensor, &sensor_subcmd, "Sensor commands", NULL);