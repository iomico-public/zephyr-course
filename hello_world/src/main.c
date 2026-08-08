#include <stdio.h>
#include <zephyr/kernel.h> 
int main(){
	printk("Hello World");
	k_msleep(1000);
}
