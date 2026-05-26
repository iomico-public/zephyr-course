#ifndef LED_SENSOR_H
#define LED_SENSOR_H

#include <zephyr/device.h>

/* Estructura de datos dinámica (runtime) */
struct led_sensor_data {
    bool led_state;       /* estado actual del LED */
    int  toggle_count;    /* parámetro para API custom de Task 2 */
};

/* Estructura de configuración estática */
struct led_sensor_config {
    struct gpio_dt_spec led_gpio;
};

#endif /* LED_SENSOR_H */