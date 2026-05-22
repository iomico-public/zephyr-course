#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define LED_NODE DT_ALIAS(app_led)
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(LED_NODE, gpios);

int main(void)
{
    bool led_state = true;

    if (!gpio_is_ready_dt(&led)) {
        LOG_ERR("LED not ready!");
        return -1;
    }

    if (gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE) < 0) {
        LOG_ERR("Unable to configure LED!");
        return -1;
    }

    while (1) {
        led_state = !led_state;
        if (gpio_pin_toggle_dt(&led) < 0) {
            LOG_ERR("Unable to toggle the LED!");
            return -1;
        }
        LOG_INF("LED state: %s", led_state ? "ON" : "OFF");
        k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);
    }
    return 0;
}
