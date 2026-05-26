#define DT_DRV_COMPAT iomico_led_sensor

#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/logging/log.h>
#include "../../include/led_sensor/led_sensor.h"
#include <string.h>

/* Config struct - privada, solo el driver la necesita */
struct led_sensor_config {
    struct gpio_dt_spec led_gpio;
};


LOG_MODULE_REGISTER(led_sensor, CONFIG_SENSOR_LOG_LEVEL);

/* --- sensor_sample_fetch: enciende el LED --- */
static int led_sensor_sample_fetch(const struct device *dev,
                                   enum sensor_channel chan)
{
    const struct led_sensor_config *cfg = dev->config;
    struct led_sensor_data *data = dev->data;

    gpio_pin_set_dt(&cfg->led_gpio, 1);
    data->led_state = true;
    LOG_INF("LED ON - %s", data->message);
    return 0;
}

/* --- sensor_channel_get: apaga el LED --- */
static int led_sensor_channel_get(const struct device *dev,
                                  enum sensor_channel chan,
                                  struct sensor_value *val)
{
    const struct led_sensor_config *cfg = dev->config;
    struct led_sensor_data *data = dev->data;

    gpio_pin_set_dt(&cfg->led_gpio, 0);
    data->led_state = false;
    val->val1 = 0;
    val->val2 = 0;
    LOG_INF("LED apagado (channel_get)");
    return 0;
}

int led_sensor_set_message(const struct device *dev, const char *msg)
{
    struct led_sensor_data *data = dev->data;
    strncpy(data->message, msg, sizeof(data->message) - 1);
    LOG_INF("Mensaje actualizado: %s", data->message);
    return 0;
}

int led_sensor_set_toggle_count(const struct device *dev, int count)
{
    struct led_sensor_data *data = dev->data;
    data->toggle_count = count;
    LOG_INF("toggle_count seteado a %d", count);
    return 0;
}


/* --- init --- */
static int led_sensor_init(const struct device *dev)
{
    const struct led_sensor_config *cfg = dev->config;

    if (!gpio_is_ready_dt(&cfg->led_gpio)) {
        LOG_ERR("GPIO no está listo");
        return -ENODEV;
    }
    gpio_pin_configure_dt(&cfg->led_gpio, GPIO_OUTPUT_INACTIVE);
    LOG_INF("LED sensor inicializado");
    return 0;
}

/* --- tabla de funciones de la Sensor API --- */
static const struct sensor_driver_api led_sensor_api = {
    .sample_fetch = led_sensor_sample_fetch,
    .channel_get  = led_sensor_channel_get,
};

/* --- macro de instanciación (igual o similar a la clase) --- */
#define LED_SENSOR_DEFINE(inst)                                         \
    static struct led_sensor_data data_##inst;                          \
    static const struct led_sensor_config cfg_##inst = {                \
        .led_gpio = GPIO_DT_SPEC_INST_GET(inst, gpios),                 \
    };                                                                   \
    DEVICE_DT_INST_DEFINE(inst,                                         \
                          led_sensor_init,                               \
                          NULL,                                          \
                          &data_##inst,                                  \
                          &cfg_##inst,                                   \
                          POST_KERNEL,                                   \
                          CONFIG_SENSOR_INIT_PRIORITY,                   \
                          &led_sensor_api);

DT_INST_FOREACH_STATUS_OKAY(LED_SENSOR_DEFINE)