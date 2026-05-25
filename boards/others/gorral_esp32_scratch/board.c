#include <zephyr/init.h>
#include <zephyr/sys/printk.h>

static int gorral_esp32_scratch_board_init(void)
{
printk("Board Initialized\n");
return 0;
}

SYS_INIT(gorral_esp32_scratch_board_init, APPLICATION, CONFIG_APPLICATION_INIT_PRIORITY);
