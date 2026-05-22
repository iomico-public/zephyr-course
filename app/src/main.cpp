#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/drivers/pwm.h>
#include <zephyr/logging/log.h>


/* Get the PWM device from the devicetree alias */
static const struct pwm_dt_spec led_pwm = PWM_DT_SPEC_GET(DT_ALIAS(pwm_led0));

LOG_MODULE_REGISTER(main, LOG_LEVEL_INF);

int main(void)
{
    bool led_state = false;

    uint32_t led_brightness_step = led_pwm.period / 100; // 1%

    if (!pwm_is_ready_dt(&led_pwm))
        return 0;

    while (1)
    {
        led_state = !led_state;

	    uint32_t duty_cycle = (CONFIG_LED_BRIGHTNESS * led_brightness_step);

	    if (pwm_set_pulse_dt(&led_pwm, led_state ? duty_cycle : 0) < 0)
		    return 0;

        if (CONFIG_LED_DEBUG)
            LOG_INF("LED state: %s (%d%% duty cycle [%d ns/%d ns])",
                    led_state ? "ON" : "OFF",
                    led_state ? CONFIG_LED_BRIGHTNESS : 0,
                    led_state ? duty_cycle : 0,
                    led_pwm.period);

	    k_msleep(CONFIG_BLINK_SLEEP_MS);
    }

    return 0;

}
