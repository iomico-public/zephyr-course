# L2 Task 1 - LED Blink

## Description
Simple LED blink application using Zephyr RTOS.
The LED toggles every 1 second.

## Hardware
- Board: STM32 Nucleo

## What I did - Steps

## Fork and Clone the repository
````git clone https://github.com/danilocoletto/zephyr-course.git````

````west update````
## How to build

````west build -p always -b nucleo_l476rg zephyr-course/app ```

## How to flash
```west flash```
```