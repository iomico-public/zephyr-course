#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(kernel_sched, LOG_LEVEL_INF);

#define STACK_SIZE 1024

void t_low_fn(void *p1, void *p2, void *p3)
{
	while (1) {
		LOG_INF("T_LOW running");
		k_sleep(K_MSEC(300));
	}
}

void t_med_fn(void *p1, void *p2, void *p3)
{
	while (1) {
		LOG_INF("T_MED running");
		k_sleep(K_MSEC(200));
	}
}

void t_high_fn(void *p1, void *p2, void *p3)
{
	while (1) {
		LOG_INF("T_HIGH running");
		k_sleep(K_MSEC(100));
	}
}

void t_coop_fn(void *p1, void *p2, void *p3)
{
	while (1) {
		for (int i = 0; i < 5; i++) {
			LOG_INF("T_COOP busy work iteration %d", i + 1);
			k_busy_wait(50000);
		}
		k_yield();
	}
}

/* Preemptive threads (priorities >= 0) */
K_THREAD_DEFINE(t_low_id, STACK_SIZE, t_low_fn, NULL, NULL, NULL, 7, 0, 0);
K_THREAD_DEFINE(t_med_id, STACK_SIZE, t_med_fn, NULL, NULL, NULL, 5, 0, 0);
K_THREAD_DEFINE(t_high_id, STACK_SIZE, t_high_fn, NULL, NULL, NULL, 3, 0, 0);

/* Cooperative thread (priority < 0) */
K_THREAD_DEFINE(t_coop_id, STACK_SIZE, t_coop_fn, NULL, NULL, NULL, -1, 0, 0);
