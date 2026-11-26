#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>
#include <zephyr/drivers/gpio.h>

static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(DT_ALIAS(led0), gpios);

int main(void)
{
	bool led_ok = gpio_is_ready_dt(&led);

	if (led_ok) {
		gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);
	}

	while (1) {
		printk("Hello World! %s\n", CONFIG_BOARD);
		if (led_ok) {
			gpio_pin_toggle_dt(&led);
		}
		k_msleep(1000);
	}
	return 0;
}
