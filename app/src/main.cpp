#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <led_sensor/led_sensor.h>

int main(void)
{
    const struct device *dev = DEVICE_DT_GET_ANY(iomico_led_sensor);

    if (!device_is_ready(dev)) {
        printk("LED sensor no está listo\n");
        return -ENODEV;
    }

    led_sensor_set_message(dev, "shell mode");
    printk("LED sensor listo. Usa la shell: sensor fetch/read/info\n");

    /* El control ahora viene desde la shell */
    return 0;
}