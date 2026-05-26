#include <zephyr/kernel.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/device.h>

int main(void)
{
    const struct device *dev = DEVICE_DT_GET_ANY(iomico_led_sensor);

    if (!device_is_ready(dev)) {
        printk("LED sensor no está listo\n");
        return -ENODEV;
    }

    while (1) {
        /* fetch → enciende el LED */
        sensor_sample_fetch(dev);
        k_sleep(K_MSEC(500));

        /* channel_get → apaga el LED */
        struct sensor_value val;
        sensor_channel_get(dev, SENSOR_CHAN_ALL, &val);
        k_sleep(K_MSEC(500));
    }
    return 0;
}
