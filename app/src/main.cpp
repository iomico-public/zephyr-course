/*
 * Copyright (c) 2017 Linaro Limited
 * Copyright (c) 2018 Intel Corporation
 * Copyright (c) 2024 TOKITA Hiroshi
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <errno.h>
#include <string.h>

#define LOG_LEVEL 4
#include <zephyr/logging/log.h>
LOG_MODULE_REGISTER(main);

#include <zephyr/kernel.h>
#include <zephyr/drivers/led_strip.h>
#include <zephyr/device.h>
#include <zephyr/drivers/spi.h>
#include <zephyr/sys/util.h>

#define STRIP_NODE		DT_ALIAS(app_led)

#if DT_NODE_HAS_PROP(DT_ALIAS(app_led), chain_length)
#define STRIP_NUM_PIXELS	DT_PROP(DT_ALIAS(app_led), chain_length)
#else
#error Unable to determine length of LED strip
#endif

#define RGB(_r, _g, _b) { .r = (_r), .g = (_g), .b = (_b) }

static const struct led_rgb COLOR_ON = RGB(0x00, CONFIG_SAMPLE_LED_BRIGHTNESS, 0x00);

static struct led_rgb pixels[STRIP_NUM_PIXELS];

static const struct device *const strip = DEVICE_DT_GET(STRIP_NODE);

int main(void)
{
	int rc;

	if (device_is_ready(strip)) {
		LOG_INF("Found LED strip device %s", strip->name);
	} else {
		LOG_ERR("LED strip device %s is not ready", strip->name);
		return 0;
	}

	LOG_INF("Heartbeat period: %d ms", CONFIG_APP_HEARTBEAT_PERIOD_MS);

	while (1) {
		/* ON */
		memset(pixels, 0x00, sizeof(pixels));
		pixels[0] = COLOR_ON;
		rc = led_strip_update_rgb(strip, pixels, STRIP_NUM_PIXELS);
		if (rc) {
			LOG_ERR("couldn't update strip: %d", rc);
		}
		k_sleep(K_MSEC(CONFIG_APP_HEARTBEAT_PERIOD_MS / 2));

		/* OFF */
		memset(pixels, 0x00, sizeof(pixels));
		rc = led_strip_update_rgb(strip, pixels, STRIP_NUM_PIXELS);
		if (rc) {
			LOG_ERR("couldn't update strip: %d", rc);
		}
		k_sleep(K_MSEC(CONFIG_APP_HEARTBEAT_PERIOD_MS / 2));
	}

	return 0;
}
