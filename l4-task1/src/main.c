#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

/* 
 * Requirement: Use DT_ALIAS(app_led) for the GPIO reference.
 * Note: Devicetree transforms hyphenated strings (app-led) to snake_case (app_led).
 */
#define APP_LED_NODE DT_ALIAS(app_led)

static const struct gpio_dt_spec heartbeat_led = GPIO_DT_SPEC_GET(APP_LED_NODE, gpios);

int main(void)
{
    int ret;

    // Validate that the device tree binding is ready
    if (!gpio_is_ready_dt(&heartbeat_led)) {
        LOG_ERR("Error: The app-led devicetree alias node is not ready.");
        return -EIO;
    }

    // Standard driver API configuration - initializes pin direction
    ret = gpio_pin_configure_dt(&heartbeat_led, GPIO_OUTPUT_ACTIVE);
    if (ret < 0) {
        LOG_ERR("Failed to configure pin properties (Error code: %d)", ret);
        return ret;
    }

    LOG_INF("Heartbeat application initiated successfully!");
    LOG_INF("Target blinking frequency window: %d ms", CONFIG_APP_HEARTBEAT_PERIOD_MS);

    while (1) {
        // Safe, hardware-abstracted pin state inversion
        gpio_pin_toggle_dt(&heartbeat_led);

        // Requirement: Use CONFIG_APP_HEARTBEAT_PERIOD_MS for the sleep duration
        k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);
    }

    return 0;
}
