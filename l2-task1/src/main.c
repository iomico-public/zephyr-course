#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/sys/printk.h>

// Fetch the clean structural overlay mapping for your breadboard GP15 circuit loop
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(DT_ALIAS(external_led), gpios);

int main(void)
{
    k_msleep(1000);
    printk("*** Booting Zephyr External LED Firmware ***\n");

    if (!gpio_is_ready_dt(&led)) {
        printk("Error: GPIO port device framework is not ready!\n");
        return 0;
    }

    // Configure the pin structure with native active voltage layout properties
    gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);

    while (1) {
        gpio_pin_toggle_dt(&led);
        printk("LED Pin 15 Toggled!\n");
        k_msleep(1000); // Sleep cleanly for 1 second (1000ms)
    }

    return 0;
}
