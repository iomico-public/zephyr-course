#ifndef _KERNEL_VERSION_H_
#define _KERNEL_VERSION_H_

/* The template values come from cmake/modules/version.cmake
 * BUILD_VERSION related template values will be 'git describe',
 * alternatively user defined BUILD_VERSION.
 */

#define ZEPHYR_VERSION_CODE 263523
#define ZEPHYR_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))

#define KERNELVERSION                   0x4056300
#define KERNEL_VERSION_NUMBER           0x40563
#define KERNEL_VERSION_MAJOR            4
#define KERNEL_VERSION_MINOR            5
#define KERNEL_PATCHLEVEL               99
#define KERNEL_TWEAK                    0
#define KERNEL_EXTRAVERSION             
#define KERNEL_VERSION_STRING           "4.5.99"
#define KERNEL_VERSION_EXTENDED_STRING  "4.5.99+0"
#define KERNEL_VERSION_TWEAK_STRING     "4.5.99+0"

#define BUILD_VERSION v4.5.0-2961-g7cd4b562b30a


#endif /* _KERNEL_VERSION_H_ */
