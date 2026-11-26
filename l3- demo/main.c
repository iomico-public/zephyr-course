#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

// Fetch the green onboard LED spec using a purely lowercase alias macro
static const struct gpio_dt_spec led = GPIO_DT_SPEC_GET(DT_ALIAS(led0), gpios);

int main(void)
{
    int ret;

    if (!gpio_is_ready_dt(&led)) {
        LOG_ERR("Error: Onboard LED GPIO device is not ready.");
        return -EIO;
    }

    ret = gpio_pin_configure_dt(&led, GPIO_OUTPUT_ACTIVE);
    if (ret < 0) {
        LOG_ERR("Error: Failed to configure LED pin (error %d).", ret);
        return ret;
    }

    LOG_INF("LED Subsystem application started successfully!");

    while (1) {
        gpio_pin_toggle_dt(&led);

        // Fallback checks to prevent compilation crashes if Kconfig cache is out of sync
        #if defined(CONFIG_ENABLE_LED_DEBUGGING) && defined(CONFIG_BLINK_SLEEP_TIME_MS)
            LOG_INF("Debug: LED toggled. Rate: %d ms", CONFIG_BLINK_SLEEP_TIME_MS);
        #endif

        #define SLEEP_TIME_VAL 1000
        #ifdef CONFIG_BLINK_SLEEP_TIME_MS
            #undef SLEEP_TIME_VAL
            #define SLEEP_TIME_VAL CONFIG_BLINK_SLEEP_TIME_MS
        #endif

        k_msleep(SLEEP_TIME_VAL);
    }

    return 0;
}
