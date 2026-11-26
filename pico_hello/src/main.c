#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>

int main(void)
{
    // Brief safety pause on boot to let clock lines settle
    k_msleep(1000);
    printk("*** Booting Zephyr OS ***\n");

    while (1) {
        printk("PICO_W_HELLO_SUCCESSFUL!\n");
        k_msleep(1000); // Wait exactly 1 second
    }

    return 0;
}
