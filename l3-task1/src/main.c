#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define LED_NODE DT_ALIAS(led0)
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED_NODE, gpios);

int main(void)
{
    bool led_state = true;

    LOG_INF("LED Subsystem started");
    LOG_INF("Blink interval: %d ms", CONFIG_LED_BLINK_SLEEP_MS);
    LOG_INF("Brightness: %d", CONFIG_LED_BRIGHTNESS);
    LOG_INF("Fade duration: %d ms", CONFIG_LED_FADE_DURATION);

    if (!gpio_is_ready_dt(&led)) return 0;
    if (gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE) < 0) return 0;

    while (1) {
        if (gpio_pin_toggle_dt(&led) < 0) return 0;
        led_state = !led_state;
        LOG_INF("LED state: %s", led_state ? "ON" : "OFF");
        k_msleep(CONFIG_LED_BLINK_SLEEP_MS);
    }

    return 0;
}