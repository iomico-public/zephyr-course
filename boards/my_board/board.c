#include <zephyr/kernel.h>
#include <zephyr/init.h>

static int init_fn(void)
{
	printk("Board Initialized\n");
	return 0;
}

SYS_INIT(init_fn, APPLICATION, 0);