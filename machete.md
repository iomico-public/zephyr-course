# Pasos

mkdir workspace

cd workspace

git clone  git@github.com:cpantel/zephyr-course.git

```
[west.yml]
      import:
        name-allowlist:
          - cmsis_6
          - hal_nxp
          - hal_stm32
west flash --runner openocd          - hal_rpi_pico
```

python3 -m venv zephyr-course/.venv

source zephyr-course/.venv/bin/activate

pip install west

west init -l zephyr-course/

cd zephyr-course/

west update

west zephyr-export

west packages pip --install

## esp32 (falla compilación)

\# agregar hal_espressif a west.yml

west blobs fetch hal_espressif

\# ambos fallan con

\# zephyr/include/zephyr/device.h:96:41: error: '__device_dts_ord_DT_N_ALIAS_led0_P_gpios_IDX_0_PH_ORD' was not declared in this scope

\# zephyr/include/zephyr/devicetree.h:236:32: error: 'DT_N_ALIAS_led0_P_gpios_IDX_0_VAL_pin' was not declared in this scope

### esp32s2_saola

west build -p always -b esp32s2_saola app/

### esp32s3_devkitc

west build -p always -b esp32s3_devkitc app/


## stm32f429i_disc1 (falla flash)

west build -p always -b stm32f429i_disc1 app/

west flash --runner openocd

\# se desconecta, quizás sea por estar usando una VM

## rpi_pico (falla comportamiento)

\# en lugar de onda cuadrada hace picos

west build -p always -b rpi_pico 1app/



## mimxrt1020_evk (falla flash o no se está manifestando)

west build -p always -b mimxrt1020_evk app/

python ../deps/zephyr/scripts/build/uf2conv.py -c build/zephyr/zephyr.bin 

\# copiar zephyr.uf2

\# no se está manifestando


## kv260_r5 (falla compilación)

\# zephyr/include/zephyr/arch/arm/asm_inline_gcc.h:24:10: fatal error: cmsis_core.h: No such file or directory

west build -p always -b kv260_r5 app/


