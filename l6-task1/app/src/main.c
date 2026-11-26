#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>

int main(void)
{
    const struct device *dev = DEVICE_DT_GET_ANY(custom_led_sensor);

    if (dev == NULL || !device_is_ready(dev)) {
        printk("No device found\n");
        return 0;
    }

    while (1) {
        /* Turn ON */
        sensor_sample_fetch(dev);
        k_msleep(1000);
        
        /* Turn OFF */
        struct sensor_value val;
        sensor_channel_get(dev, SENSOR_CHAN_ALL, &val);
        k_msleep(1000);
    }
    return 0;
}