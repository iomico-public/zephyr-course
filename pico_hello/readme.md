
------------------------------
## Step 1: Create a Clean Project Directory

Open your terminal and run:

# 1. Move to your home folder
cd ~
# 2. Create a brand new project directory structure
mkdir -p pico_hello/src
# 3. Move into your new project directory
cd pico_hello

------------------------------
## Step 2: Write the C Code (src/main.c)
Create a completely fresh C file with an infinite loop. This ensures that even if you connect your serial monitor late, the text will keep printing and won't be missed.
Run this command to open the editor:

nano src/main.c

Paste this exact code inside, save (Ctrl+O, Enter), and exit (Ctrl+X):

#include <zephyr/kernel.h>#include <zephyr/sys/printk.h>
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

------------------------------
## Step 3: Write the Configuration File (prj.conf)
We will configure Zephyr to use the hardware UART serial pins. Since you are using a Debug Probe, these pins route straight through the probe back to your laptop, completely avoiding the problematic USB drivers.
Open the file:

nano prj.conf

Paste these three lines inside, save, and exit:

CONFIG_SERIAL=y
CONFIG_CONSOLE=y
CONFIG_UART_CONSOLE=y

------------------------------
## Step 4: Write the Build File (CMakeLists.txt)
Create the standard layout that tells the Zephyr system how to look at your application.
Open the file:

nano CMakeLists.txt

Paste this clean structure inside, save, and exit:

cmake_minimum_required(VERSION 3.20.0)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})project(pico_hello LANGUAGES C)
target_sources(app PRIVATE src/main.c)

------------------------------
## Step 5: Activate and Build for Pico W
Now we move back into your main workspace workspace tracker, point the toolchains away from clang-cl back to the proper GCC compiler, and build cleanly.
Run these commands:

# 1. Move back to your initialized zephyr workspace folder
cd ~/zephyrproject
# 2. Activate the python virtual environment
source /home/spamboii/.pico-sdk/zephyr_workspace/venv/bin/activate
# 3. Build your new project cleanly for the Pico W board profile
west build -p always -b rpi_pico/rp2040/w -d ~/pico_hello/build ~/pico_hello

(Verify that this finishes with a green compile message or lists text showing Wrote zephyr.uf2 / zephyr.elf).
------------------------------
## Step 6: Flash over SWD via your Debug Probe
With the correct binary built, let's use your stable OpenOCD configuration to push the firmware down the lines at full speed.
Run this single command:

/usr/bin/openocd \
  -s /home/spamboii/zephyr-sdk-1.0.1/hosttools/sysroots/x86_64-pokysdk-linux/usr/share/openocd/scripts \
  -f interface/cmsis-dap.cfg \
  -f target/rp2040.cfg \
  -c "adapter speed 2000; init; program /home/spamboii/pico_hello/build/zephyr/zephyr.elf verify reset exit"

(Look closely at the final log lines. It will end cleanly with a ** Verified OK ** and a target shutdown command invocation).
------------------------------
## Step 7: View the Output Stream
Now, your Pico W is up and running. Your hardware Debug Probe bridges the physical TX/RX wires to your laptop over its USB cable. Let's find out which port your laptop chose.
## 1. List Active Devices
Run this command to check the port paths:

ls /dev/ttyACM*

(You will see paths like /dev/ttyACM0 and /dev/ttyACM1).
## 2. Connect to the Live Terminal Stream
Open your virtual python environment serial terminal viewer on your first port node:

python3 -m serial.tools.miniterm /dev/ttyACM0 115200


* If the screen remains completely blank or throws an assignment error: Press Ctrl + ] to close the python script tool, and point it instantly to your other port node instead:

python3 -m serial.tools.miniterm /dev/ttyACM1 115200


Because your C code loops and updates every single second, your terminal screen will immediately begin filling up with:
PICO_W_HELLO_SUCCESSFUL!

