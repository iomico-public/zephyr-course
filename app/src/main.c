#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(sync_race, LOG_LEVEL_INF);

#define STACK_SIZE 1024
#define ITERATIONS 1000

static volatile int shared_counter = 0;

void worker_fn(void *p1, void *p2, void *p3)
{
	const char *name = (const char *)p1;

	for (int i = 0; i < ITERATIONS; i++) {
		int temp = shared_counter;
		k_busy_wait(1); /* Widens read-modify-write window */
		shared_counter = temp + 1;
	}

	LOG_INF("%s finished (current counter = %d)", name, shared_counter);
}

K_THREAD_DEFINE(thread_a, STACK_SIZE, worker_fn, "Thread A", NULL, NULL, 5, 0, 0);
K_THREAD_DEFINE(thread_b, STACK_SIZE, worker_fn, "Thread B", NULL, NULL, 5, 0, 0);

int main(void)
{
	k_thread_join(thread_a, K_FOREVER);
	k_thread_join(thread_b, K_FOREVER);

	LOG_INF("Expected: %d | Actual (UNPROTECTED): %d",
		ITERATIONS * 2, shared_counter);
	return 0;
}
