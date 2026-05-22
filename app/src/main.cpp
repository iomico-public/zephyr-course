#include <zephyr/drivers/gpio.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

#define SLEEP_TIME_MS 2000

/* The devicetree node identifier for the "led0" alias. */
#define LED_NODE DT_ALIAS(led0)

static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED_NODE, gpios);

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

int main(void)
{
    bool led_state = true;

    if (!gpio_is_ready_dt(&led)) return 0;

    if (gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE) < 0) return 0;

    while (1) {
        for (int i=1; i < 5; ++i) {

            if (gpio_pin_toggle_dt(&led) < 0) return 0;
            led_state = !led_state;
            LOG_INF("LED state: %s delay: %d", led_state ? "ON" : "OFF", SLEEP_TIME_MS / i);
            k_msleep(SLEEP_TIME_MS / i);
            if (gpio_pin_toggle_dt(&led) < 0) return 0;
            led_state = !led_state;
            LOG_INF("LED state: %s delay: %d", led_state ? "ON" : "OFF", SLEEP_TIME_MS / i);
            k_msleep(SLEEP_TIME_MS / i);
	}
    }
    return 0;
}
