#ifndef SARCHE_DRIVER_H_
#define SARCHE_DRIVER_H_

#include <zephyr/drivers/sensor.h>

#ifdef __cplusplus
extern "C" {
#endif

struct sarche_driver_api {
	struct sensor_driver_api sensor;
	int (*set_user_param)(const struct device *dev, int value);
};

static inline int sarche_set_user_param(const struct device *dev, int value)
{
	const struct sarche_driver_api *api = (const struct sarche_driver_api *)dev->api;
	return api->set_user_param(dev, value);
}

#ifdef __cplusplus
}
#endif

#endif /* SARCHE_DRIVER_H_ */
