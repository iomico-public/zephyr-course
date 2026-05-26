#include "zephyr/device.h"
#include "zephyr/drivers/sensor.h"
#include <zephyr/drivers/gpio.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

#include "our_driver.h"

/* The devicetree node identifier for the "led0" alias. */
#define HEARTBEAT_LED DT_ALIAS(app_led)

static const struct gpio_dt_spec heartbeat_led = GPIO_DT_SPEC_GET(HEARTBEAT_LED, gpios);

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

namespace {
    void test() {
        const struct device* driver = DEVICE_DT_GET(DT_NODELABEL(our_driver0));
        struct sensor_value val;

        if(!device_is_ready(driver)) {
            LOG_ERR("our_driver0 is not ready");
            return;
        }

        auto ret = our_driver_set_temperature_offset(driver, 10);
        LOG_INF("Set offset ret %d", ret);
        
        ret = sensor_sample_fetch(driver);
        LOG_INF("Fetch ret %d", ret);
        
        ret = sensor_channel_get(driver, SENSOR_CHAN_AMBIENT_TEMP, &val);
        LOG_INF("Channel ret %d, temp %d.%06d C", ret, val.val1, val.val2);
    }
}

int main(void)
{
    bool heartbeat_led_state = true;

    if (!gpio_is_ready_dt(&heartbeat_led)) return 0;

    if (gpio_pin_configure_dt(&heartbeat_led, GPIO_OUTPUT_ACTIVE) < 0) return 0;

    while (1) {
        if (gpio_pin_toggle_dt(&heartbeat_led) < 0) return 0;

        heartbeat_led_state = !heartbeat_led_state;
        LOG_INF("Heartbeat LED state: %s", heartbeat_led_state ? "ON" : "OFF");
        k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);
    }
    return 0;
}
