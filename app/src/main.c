#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

#define APP_LED_NODE DT_ALIAS(app_led)

#if !DT_NODE_HAS_STATUS(APP_LED_NODE, okay)
#error "Alias app-led is not defined in devicetree"
#endif

static const struct gpio_dt_spec app_led = GPIO_DT_SPEC_GET(APP_LED_NODE, gpios);

int main(void)
{
	bool led_state = false;

	if (!gpio_is_ready_dt(&app_led)) {
		LOG_ERR("app-led GPIO device is not ready");
		return 0;
	}

	if (gpio_pin_configure_dt(&app_led, GPIO_OUTPUT_INACTIVE) < 0) {
		LOG_ERR("Failed to configure app-led");
		return 0;
	}

	LOG_INF("Heartbeat started, period=%d ms", CONFIG_APP_HEARTBEAT_PERIOD_MS);

	while (1) {
		if (gpio_pin_toggle_dt(&app_led) < 0) {
			LOG_ERR("Failed to toggle app-led");
			return 0;
		}

		led_state = !led_state;
		LOG_INF("Heartbeat LED: %s, period=%d ms",
			led_state ? "ON" : "OFF",
			CONFIG_APP_HEARTBEAT_PERIOD_MS);

		k_msleep(CONFIG_APP_HEARTBEAT_PERIOD_MS);
	}

	return 0;
}