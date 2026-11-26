#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

/* Fallback default definition if menuconfig options are hidden */
#ifndef CONFIG_BLINK_SLEEP_TIME_MS
#define CONFIG_BLINK_SLEEP_TIME_MS 1000
#endif

/* 
 * Target the board's native pre-configured green LED alias directly.
 * No custom app.overlay required!
 */
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(DT_ALIAS(led1), gpios);

int main(void)
{
    int ret;
    bool led_state = false;

    // Check if the onboard GPIO controller peripheral is fully online
    if (!gpio_is_ready_dt(&led)) {
        LOG_ERR("Hardware Error: Onboard GPIO controller for led1 is not ready.");
        return -EIO;
    }

    // Configure the target pin as a standard output, initializing it to INACTIVE (off)
    ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT_INACTIVE);
    if (ret < 0) {
        LOG_ERR("Error: Failed to configure LED pin framework (code %d).", ret);
        return ret;
    }

    LOG_INF("Overlay-free GPIO LED blink application initialized on FRDM-MCXN236!");
    LOG_INF("Blink interval synchronized to: %d ms", CONFIG_BLINK_SLEEP_TIME_MS);

    while (1) {
        // Toggle our logic state tracker variable
        led_state = !led_state;
        
        // Drive the physical pin high or low logically
        ret = gpio_pin_set_dt(&led, (int)led_state);
        if (ret < 0) {
            LOG_ERR("GPIO Error: Failed to toggle pin value (code %d).", ret);
            return ret;
        }

        #if IS_ENABLED(CONFIG_ENABLE_LED_DEBUGGING)
            LOG_INF("Debug Flag: LED toggled to state %d.", led_state);
        #endif

        // Apply your custom hierarchical sleep time dynamically from Kconfig
        k_msleep(CONFIG_BLINK_SLEEP_TIME_MS);
    }

    return 0;
}
