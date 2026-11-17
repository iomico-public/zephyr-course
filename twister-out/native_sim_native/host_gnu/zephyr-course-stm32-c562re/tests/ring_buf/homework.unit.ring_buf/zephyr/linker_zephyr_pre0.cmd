SECTIONS
{
rom_start :
{
}
 initlevel :
 {
  __init_start = .;
  __init_EARLY_start = .; KEEP(*(SORT(.z_init_EARLY_P_?_*))); KEEP(*(SORT(.z_init_EARLY_P_??_*))); KEEP(*(SORT(.z_init_EARLY_P_???_*)));
  __init_PRE_KERNEL_1_start = .; KEEP(*(SORT(.z_init_PRE_KERNEL_1_P_?_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_1_P_??_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_1_P_???_*)));
  __init_PRE_KERNEL_2_start = .; KEEP(*(SORT(.z_init_PRE_KERNEL_2_P_?_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_2_P_??_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_2_P_???_*)));
  __init_POST_KERNEL_start = .; KEEP(*(SORT(.z_init_POST_KERNEL_P_?_*))); KEEP(*(SORT(.z_init_POST_KERNEL_P_??_*))); KEEP(*(SORT(.z_init_POST_KERNEL_P_???_*)));
  __init_APPLICATION_start = .; KEEP(*(SORT(.z_init_APPLICATION_P_?_*))); KEEP(*(SORT(.z_init_APPLICATION_P_??_*))); KEEP(*(SORT(.z_init_APPLICATION_P_???_*)));
  __init_SMP_start = .; KEEP(*(SORT(.z_init_SMP_P_?_*))); KEEP(*(SORT(.z_init_SMP_P_??_*))); KEEP(*(SORT(.z_init_SMP_P_???_*)));
  __init_end = .;
 }
 device_area : { _device_list_start = .; KEEP(*(SORT(._device.static.*_?_*))); KEEP(*(SORT(._device.static.*_??_*))); KEEP(*(SORT(._device.static.*_???_*))); KEEP(*(SORT(._device.static.*_????_*))); KEEP(*(SORT(._device.static.*_?????_*))); _device_list_end = .;; }
 initlevel_error :
 {
  KEEP(*(SORT(.z_init_*)))
 }
 ASSERT(SIZEOF(initlevel_error) == 0, "Undefined initialization levels used.")
 app_shmem_regions :
 {
  __app_shmem_regions_start = .;
  KEEP(*(SORT(.app_regions.*)));
  __app_shmem_regions_end = .;
 }
 k_p4wq_initparam_area : { _k_p4wq_initparam_list_start = .; KEEP(*(SORT_BY_NAME(._k_p4wq_initparam.static.*))); _k_p4wq_initparam_list_end = .;; }
 k_kernel_init_pre_entry_area : { _k_kernel_init_pre_entry_list_start = .; KEEP(*(SORT_BY_NAME(._k_kernel_init_pre_entry.static.*))); _k_kernel_init_pre_entry_list_end = .;; }
 k_kernel_init_post_entry_area : { _k_kernel_init_post_entry_list_start = .; KEEP(*(SORT_BY_NAME(._k_kernel_init_post_entry.static.*))); _k_kernel_init_post_entry_list_end = .;; }
 _static_thread_data_area : { __static_thread_data_list_start = .; KEEP(*(SORT_BY_NAME(.__static_thread_data.static.*))); __static_thread_data_list_end = .;; }
 device_deps :
 {
__device_deps_start = .;
KEEP(*(SORT(.__device_deps_pass2*)));
__device_deps_end = .;
 }
device_api_area : SUBALIGN(4)
{
 _shared_irq_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._shared_irq_driver_api.static.*))); _shared_irq_driver_api_list_end = .;;
 _shared_irq_driver_api_ext_end = .;
 _audio_codec_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._audio_codec_driver_api.static.*))); _audio_codec_driver_api_list_end = .;;
 _audio_codec_driver_api_ext_end = .;
 _dmic_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dmic_driver_api.static.*))); _dmic_driver_api_list_end = .;;
 _dmic_driver_api_ext_end = .;
 _crypto_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._crypto_driver_api.static.*))); _crypto_driver_api_list_end = .;;
 _crypto_driver_api_ext_end = .;
 _adc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._adc_driver_api.static.*))); _adc_driver_api_list_end = .;;
 _adc_driver_api_ext_end = .;
 _auxdisplay_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._auxdisplay_driver_api.static.*))); _auxdisplay_driver_api_list_end = .;;
 _auxdisplay_driver_api_ext_end = .;
 _bbram_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._bbram_driver_api.static.*))); _bbram_driver_api_list_end = .;;
 _bbram_driver_api_ext_end = .;
 _biometric_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._biometric_driver_api.static.*))); _biometric_driver_api_list_end = .;;
 _biometric_driver_api_ext_end = .;
 _bt_hci_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._bt_hci_driver_api.static.*))); _bt_hci_driver_api_list_end = .;;
 _bt_hci_driver_api_ext_end = .;
 _buzzer_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._buzzer_driver_api.static.*))); _buzzer_driver_api_list_end = .;;
 _buzzer_driver_api_ext_end = .;
 _can_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._can_driver_api.static.*))); _can_driver_api_list_end = .;;
 _can_driver_api_ext_end = .;
 _cellular_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._cellular_driver_api.static.*))); _cellular_driver_api_list_end = .;;
 _cellular_driver_api_ext_end = .;
 _charger_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._charger_driver_api.static.*))); _charger_driver_api_list_end = .;;
 _charger_driver_api_ext_end = .;
 _clock_control_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._clock_control_driver_api.static.*))); _clock_control_driver_api_list_end = .;;
 _nrf_clock_control_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._nrf_clock_control_driver_api.static.*))); _nrf_clock_control_driver_api_list_end = .;;
 _nrf_clock_control_driver_api_ext_end = .;
 _clock_control_driver_api_ext_end = .;
 _clock_monitor_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._clock_monitor_driver_api.static.*))); _clock_monitor_driver_api_list_end = .;;
 _clock_monitor_driver_api_ext_end = .;
 _comparator_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._comparator_driver_api.static.*))); _comparator_driver_api_list_end = .;;
 _comparator_driver_api_ext_end = .;
 _coredump_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._coredump_driver_api.static.*))); _coredump_driver_api_list_end = .;;
 _coredump_driver_api_ext_end = .;
 _counter_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._counter_driver_api.static.*))); _counter_driver_api_list_end = .;;
 _counter_driver_api_ext_end = .;
 _crc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._crc_driver_api.static.*))); _crc_driver_api_list_end = .;;
 _crc_driver_api_ext_end = .;
 _dac_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dac_driver_api.static.*))); _dac_driver_api_list_end = .;;
 _dac_driver_api_ext_end = .;
 _dai_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dai_driver_api.static.*))); _dai_driver_api_list_end = .;;
 _dai_driver_api_ext_end = .;
 _dali_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dali_driver_api.static.*))); _dali_driver_api_list_end = .;;
 _dali_driver_api_ext_end = .;
 _display_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._display_driver_api.static.*))); _display_driver_api_list_end = .;;
 _display_driver_api_ext_end = .;
 _dma_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dma_driver_api.static.*))); _dma_driver_api_list_end = .;;
 _dma_driver_api_ext_end = .;
 _edac_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._edac_driver_api.static.*))); _edac_driver_api_list_end = .;;
 _edac_driver_api_ext_end = .;
 _eeprom_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._eeprom_driver_api.static.*))); _eeprom_driver_api_list_end = .;;
 _eeprom_driver_api_ext_end = .;
 _emul_bbram_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._emul_bbram_driver_api.static.*))); _emul_bbram_driver_api_list_end = .;;
 _emul_bbram_driver_api_ext_end = .;
 _fuel_gauge_emul_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._fuel_gauge_emul_driver_api.static.*))); _fuel_gauge_emul_driver_api_list_end = .;;
 _fuel_gauge_emul_driver_api_ext_end = .;
 _emul_sensor_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._emul_sensor_driver_api.static.*))); _emul_sensor_driver_api_list_end = .;;
 _emul_sensor_driver_api_ext_end = .;
 _entropy_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._entropy_driver_api.static.*))); _entropy_driver_api_list_end = .;;
 _entropy_driver_api_ext_end = .;
 _espi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._espi_driver_api.static.*))); _espi_driver_api_list_end = .;;
 _emul_espi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._emul_espi_driver_api.static.*))); _emul_espi_driver_api_list_end = .;;
 _emul_espi_driver_api_ext_end = .;
 _espi_driver_api_ext_end = .;
 _espi_saf_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._espi_saf_driver_api.static.*))); _espi_saf_driver_api_list_end = .;;
 _espi_saf_driver_api_ext_end = .;
 _flash_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._flash_driver_api.static.*))); _flash_driver_api_list_end = .;;
 _flash_driver_api_ext_end = .;
 _fpga_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._fpga_driver_api.static.*))); _fpga_driver_api_list_end = .;;
 _fpga_driver_api_ext_end = .;
 _fuel_gauge_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._fuel_gauge_driver_api.static.*))); _fuel_gauge_driver_api_list_end = .;;
 _fuel_gauge_driver_api_ext_end = .;
 _gnss_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._gnss_driver_api.static.*))); _gnss_driver_api_list_end = .;;
 _gnss_driver_api_ext_end = .;
 _gpio_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._gpio_driver_api.static.*))); _gpio_driver_api_list_end = .;;
 _gpio_driver_api_ext_end = .;
 _haptics_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._haptics_driver_api.static.*))); _haptics_driver_api_list_end = .;;
 _haptics_driver_api_ext_end = .;
 _hwspinlock_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._hwspinlock_driver_api.static.*))); _hwspinlock_driver_api_list_end = .;;
 _hwspinlock_driver_api_ext_end = .;
 _i2c_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._i2c_driver_api.static.*))); _i2c_driver_api_list_end = .;;
 _i3c_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._i3c_driver_api.static.*))); _i3c_driver_api_list_end = .;;
 _i3c_driver_api_ext_end = .;
 _i2c_driver_api_ext_end = .;
 _i2c_target_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._i2c_target_driver_api.static.*))); _i2c_target_driver_api_list_end = .;;
 _i2c_target_driver_api_ext_end = .;
 _i2s_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._i2s_driver_api.static.*))); _i2s_driver_api_list_end = .;;
 _i2s_driver_api_ext_end = .;
 _ipm_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ipm_driver_api.static.*))); _ipm_driver_api_list_end = .;;
 _ipm_driver_api_ext_end = .;
 _led_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._led_driver_api.static.*))); _led_driver_api_list_end = .;;
 _led_driver_api_ext_end = .;
 _led_strip_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._led_strip_driver_api.static.*))); _led_strip_driver_api_list_end = .;;
 _led_strip_driver_api_ext_end = .;
 _lin_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._lin_driver_api.static.*))); _lin_driver_api_list_end = .;;
 _lin_driver_api_ext_end = .;
 _lora_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._lora_driver_api.static.*))); _lora_driver_api_list_end = .;;
 _lora_driver_api_ext_end = .;
 _mbox_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mbox_driver_api.static.*))); _mbox_driver_api_list_end = .;;
 _mbox_driver_api_ext_end = .;
 _mdio_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mdio_driver_api.static.*))); _mdio_driver_api_list_end = .;;
 _mdio_driver_api_ext_end = .;
 _memc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._memc_driver_api.static.*))); _memc_driver_api_list_end = .;;
 _memc_driver_api_ext_end = .;
 _mipi_dbi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mipi_dbi_driver_api.static.*))); _mipi_dbi_driver_api_list_end = .;;
 _mipi_dbi_driver_api_ext_end = .;
 _mipi_dsi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mipi_dsi_driver_api.static.*))); _mipi_dsi_driver_api_list_end = .;;
 _mipi_dsi_driver_api_ext_end = .;
 _mspi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mspi_driver_api.static.*))); _mspi_driver_api_list_end = .;;
 _emul_mspi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._emul_mspi_driver_api.static.*))); _emul_mspi_driver_api_list_end = .;;
 _emul_mspi_driver_api_ext_end = .;
 _mspi_driver_api_ext_end = .;
 _mux_control_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._mux_control_driver_api.static.*))); _mux_control_driver_api_list_end = .;;
 _mux_control_driver_api_ext_end = .;
 _opamp_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._opamp_driver_api.static.*))); _opamp_driver_api_list_end = .;;
 _opamp_driver_api_ext_end = .;
 _otp_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._otp_driver_api.static.*))); _otp_driver_api_list_end = .;;
 _otp_driver_api_ext_end = .;
 _peci_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._peci_driver_api.static.*))); _peci_driver_api_list_end = .;;
 _peci_driver_api_ext_end = .;
 _ps2_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ps2_driver_api.static.*))); _ps2_driver_api_list_end = .;;
 _ps2_driver_api_ext_end = .;
 _ptp_clock_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ptp_clock_driver_api.static.*))); _ptp_clock_driver_api_list_end = .;;
 _ptp_clock_driver_api_ext_end = .;
 _pulse_io_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._pulse_io_driver_api.static.*))); _pulse_io_driver_api_list_end = .;;
 _pulse_io_driver_api_ext_end = .;
 _pwm_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._pwm_driver_api.static.*))); _pwm_driver_api_list_end = .;;
 _pwm_driver_api_ext_end = .;
 _regulator_parent_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._regulator_parent_driver_api.static.*))); _regulator_parent_driver_api_list_end = .;;
 _regulator_parent_driver_api_ext_end = .;
 _regulator_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._regulator_driver_api.static.*))); _regulator_driver_api_list_end = .;;
 _regulator_driver_api_ext_end = .;
 _reset_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._reset_driver_api.static.*))); _reset_driver_api_list_end = .;;
 _reset_driver_api_ext_end = .;
 _retained_mem_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._retained_mem_driver_api.static.*))); _retained_mem_driver_api_list_end = .;;
 _retained_mem_driver_api_ext_end = .;
 _rtc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._rtc_driver_api.static.*))); _rtc_driver_api_list_end = .;;
 _rtc_driver_api_ext_end = .;
 _sdhc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._sdhc_driver_api.static.*))); _sdhc_driver_api_list_end = .;;
 _sdhc_driver_api_ext_end = .;
 _sensor_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._sensor_driver_api.static.*))); _sensor_driver_api_list_end = .;;
 _sensor_driver_api_ext_end = .;
 _smbus_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._smbus_driver_api.static.*))); _smbus_driver_api_list_end = .;;
 _smbus_driver_api_ext_end = .;
 _spi_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._spi_driver_api.static.*))); _spi_driver_api_list_end = .;;
 _spi_driver_api_ext_end = .;
 _syscon_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._syscon_driver_api.static.*))); _syscon_driver_api_list_end = .;;
 _syscon_driver_api_ext_end = .;
 _tee_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._tee_driver_api.static.*))); _tee_driver_api_list_end = .;;
 _tee_driver_api_ext_end = .;
 _tgpio_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._tgpio_driver_api.static.*))); _tgpio_driver_api_list_end = .;;
 _tgpio_driver_api_ext_end = .;
 _uaol_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._uaol_driver_api.static.*))); _uaol_driver_api_list_end = .;;
 _uaol_driver_api_ext_end = .;
 _video_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._video_driver_api.static.*))); _video_driver_api_list_end = .;;
 _video_driver_api_ext_end = .;
 _virtio_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._virtio_driver_api.static.*))); _virtio_driver_api_list_end = .;;
 _virtio_driver_api_ext_end = .;
 _w1_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._w1_driver_api.static.*))); _w1_driver_api_list_end = .;;
 _w1_driver_api_ext_end = .;
 _wdt_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._wdt_driver_api.static.*))); _wdt_driver_api_list_end = .;;
 _wdt_driver_api_ext_end = .;
 _wuc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._wuc_driver_api.static.*))); _wuc_driver_api_list_end = .;;
 _wuc_driver_api_ext_end = .;
 _can_transceiver_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._can_transceiver_driver_api.static.*))); _can_transceiver_driver_api_list_end = .;;
 _can_transceiver_driver_api_ext_end = .;
 _i3c_target_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._i3c_target_driver_api.static.*))); _i3c_target_driver_api_list_end = .;;
 _i3c_target_driver_api_ext_end = .;
 _its_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._its_driver_api.static.*))); _its_driver_api_list_end = .;;
 _its_driver_api_ext_end = .;
 _vtd_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._vtd_driver_api.static.*))); _vtd_driver_api_list_end = .;;
 _vtd_driver_api_ext_end = .;
 _lin_transceiver_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._lin_transceiver_driver_api.static.*))); _lin_transceiver_driver_api_list_end = .;;
 _lin_transceiver_driver_api_ext_end = .;
 _devmux_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._devmux_driver_api.static.*))); _devmux_driver_api_list_end = .;;
 _devmux_driver_api_ext_end = .;
 _renesas_elc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._renesas_elc_driver_api.static.*))); _renesas_elc_driver_api_list_end = .;;
 _renesas_elc_driver_api_ext_end = .;
 _pcie_ctrl_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._pcie_ctrl_driver_api.static.*))); _pcie_ctrl_driver_api_list_end = .;;
 _pcie_ctrl_driver_api_ext_end = .;
 _pcie_ep_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._pcie_ep_driver_api.static.*))); _pcie_ep_driver_api_list_end = .;;
 _pcie_ep_driver_api_ext_end = .;
 _psi5_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._psi5_driver_api.static.*))); _psi5_driver_api_list_end = .;;
 _psi5_driver_api_ext_end = .;
 _sent_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._sent_driver_api.static.*))); _sent_driver_api_list_end = .;;
 _sent_driver_api_ext_end = .;
 _svc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._svc_driver_api.static.*))); _svc_driver_api_list_end = .;;
 _svc_driver_api_ext_end = .;
 _stepper_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._stepper_driver_api.static.*))); _stepper_driver_api_list_end = .;;
 _stepper_driver_api_ext_end = .;
 _stepper_ctrl_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._stepper_ctrl_driver_api.static.*))); _stepper_ctrl_driver_api_list_end = .;;
 _stepper_ctrl_driver_api_ext_end = .;
 _uart_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._uart_driver_api.static.*))); _uart_driver_api_list_end = .;;
 _uart_driver_api_ext_end = .;
 _bc12_emul_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._bc12_emul_driver_api.static.*))); _bc12_emul_driver_api_list_end = .;;
 _bc12_emul_driver_api_ext_end = .;
 _uhc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._uhc_driver_api.static.*))); _uhc_driver_api_list_end = .;;
 _uhc_driver_api_ext_end = .;
 _bc12_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._bc12_driver_api.static.*))); _bc12_driver_api_list_end = .;;
 _bc12_driver_api_ext_end = .;
 _usbc_ppc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._usbc_ppc_driver_api.static.*))); _usbc_ppc_driver_api_list_end = .;;
 _usbc_ppc_driver_api_ext_end = .;
 _tcpc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._tcpc_driver_api.static.*))); _tcpc_driver_api_list_end = .;;
 _tcpc_driver_api_ext_end = .;
 _usbc_vbus_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._usbc_vbus_driver_api.static.*))); _usbc_vbus_driver_api_list_end = .;;
 _usbc_vbus_driver_api_ext_end = .;
 _ivshmem_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ivshmem_driver_api.static.*))); _ivshmem_driver_api_list_end = .;;
 _ivshmem_driver_api_ext_end = .;
 _net_if_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._net_if_driver_api.static.*))); _net_if_driver_api_list_end = .;;
 _canbus_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._canbus_driver_api.static.*))); _canbus_driver_api_list_end = .;;
 _canbus_driver_api_ext_end = .;
 _dummy_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._dummy_driver_api.static.*))); _dummy_driver_api_list_end = .;;
 _dummy_driver_api_ext_end = .;
 _ethernet_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ethernet_driver_api.static.*))); _ethernet_driver_api_list_end = .;;
 _wifi_native_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._wifi_native_driver_api.static.*))); _wifi_native_driver_api_list_end = .;;
 _wifi_native_driver_api_ext_end = .;
 _ethernet_driver_api_ext_end = .;
 _hdlc_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._hdlc_driver_api.static.*))); _hdlc_driver_api_list_end = .;;
 _hdlc_driver_api_ext_end = .;
 _ieee802154_radio_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ieee802154_radio_driver_api.static.*))); _ieee802154_radio_driver_api_list_end = .;;
 _ieee802154_radio_driver_api_ext_end = .;
 _offloaded_if_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._offloaded_if_driver_api.static.*))); _offloaded_if_driver_api_list_end = .;;
 _wifi_offload_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._wifi_offload_driver_api.static.*))); _wifi_offload_driver_api_list_end = .;;
 _wifi_offload_driver_api_ext_end = .;
 _offloaded_if_driver_api_ext_end = .;
 _ppp_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ppp_driver_api.static.*))); _ppp_driver_api_list_end = .;;
 _ppp_driver_api_ext_end = .;
 _virtual_interface_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._virtual_interface_driver_api.static.*))); _virtual_interface_driver_api_list_end = .;;
 _virtual_interface_driver_api_ext_end = .;
 _net_if_driver_api_ext_end = .;
 _ethphy_driver_api_list_start = .; KEEP(*(SORT_BY_NAME(._ethphy_driver_api.static.*))); _ethphy_driver_api_list_end = .;;
 _ethphy_driver_api_ext_end = .;
}
ztest :
{
 _ztest_expected_result_entry_list_start = .; KEEP(*(SORT_BY_NAME(._ztest_expected_result_entry.static.*))); _ztest_expected_result_entry_list_end = .;;
 _ztest_suite_node_list_start = .; KEEP(*(SORT_BY_NAME(._ztest_suite_node.static.*))); _ztest_suite_node_list_end = .;;
 _ztest_unit_test_list_start = .; KEEP(*(SORT_BY_NAME(._ztest_unit_test.static.*))); _ztest_unit_test_list_end = .;;
 _ztest_param_inst_list_start = .; KEEP(*(SORT_BY_NAME(._ztest_param_inst.static.*))); _ztest_param_inst_list_end = .;;
 _ztest_test_rule_list_start = .; KEEP(*(SORT_BY_NAME(._ztest_test_rule.static.*))); _ztest_test_rule_list_end = .;;
}
 init_array :
 {
  __zephyr_init_array_start = .;
  KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*)
   SORT_BY_INIT_PRIORITY(.ctors.*)))
  KEEP (*(.init_array .ctors))
  __zephyr_init_array_end = .;
  __CTOR_LIST__ = .;
  LONG(0)
  LONG(0)
  __CTOR_END__ = .;
  __init_array_start = .;
  __init_array_end = .;
 }
 bt_l2cap_fixed_chan_area : { _bt_l2cap_fixed_chan_list_start = .; KEEP(*(SORT_BY_NAME(._bt_l2cap_fixed_chan.static.*))); _bt_l2cap_fixed_chan_list_end = .;; }
 bt_gatt_service_static_area : { _bt_gatt_service_static_list_start = .; KEEP(*(SORT_BY_NAME(._bt_gatt_service_static.static.*))); _bt_gatt_service_static_list_end = .;; }
 log_strings_area : { _log_strings_list_start = .; KEEP(*(SORT_BY_NAME(._log_strings.static.*))); _log_strings_list_end = .;; }
 log_stmesp_ptr_area : { _log_stmesp_ptr_list_start = .; KEEP(*(SORT_BY_NAME(._log_stmesp_ptr.static.*))); _log_stmesp_ptr_list_end = .;; }
 log_stmesp_str_area : { _log_stmesp_str_list_start = .; KEEP(*(SORT_BY_NAME(._log_stmesp_str.static.*))); _log_stmesp_str_list_end = .;; }
 log_const_area : { _log_const_list_start = .; KEEP(*(SORT_BY_NAME(._log_const.static.*))); _log_const_list_end = .;; }
 log_backend_area : { _log_backend_list_start = .; KEEP(*(SORT_BY_NAME(._log_backend.static.*))); _log_backend_list_end = .;; }
 log_link_area : { _log_link_list_start = .; KEEP(*(SORT_BY_NAME(._log_link.static.*))); _log_link_list_end = .;; }
 tracing_backend_area : { _tracing_backend_list_start = .; KEEP(*(SORT_BY_NAME(._tracing_backend.static.*))); _tracing_backend_list_end = .;; }
 zephyr_dbg_info :
 {
  KEEP(*(".dbg_thread_info"));
 }
 intc_table_area : { _intc_table_list_start = .; KEEP(*(SORT_BY_NAME(._intc_table.static.*))); _intc_table_list_end = .;; }
 symbol_to_keep :
 {
  __symbol_to_keep_start = .;
  KEEP(*(SORT(.symbol_to_keep*)));
  __symbol_to_keep_end = .;
 }
 shell_area : { _shell_list_start = .; KEEP(*(SORT_BY_NAME(._shell.static.*))); _shell_list_end = .;; }
 shell_root_cmds_area : { _shell_root_cmds_list_start = .; KEEP(*(SORT_BY_NAME(._shell_root_cmds.static.*))); _shell_root_cmds_list_end = .;; }
 shell_subcmds_area : { _shell_subcmds_list_start = .; KEEP(*(SORT_BY_NAME(._shell_subcmds.static.*))); _shell_subcmds_list_end = .;; }
 shell_dynamic_subcmds_area : { _shell_dynamic_subcmds_list_start = .; KEEP(*(SORT_BY_NAME(._shell_dynamic_subcmds.static.*))); _shell_dynamic_subcmds_list_end = .;; }
 shell_remote_area : { _shell_remote_list_start = .; KEEP(*(SORT_BY_NAME(._shell_remote.static.*))); _shell_remote_list_end = .;; }
 cfb_font_area : { _cfb_font_list_start = .; KEEP(*(SORT_BY_NAME(._cfb_font.static.*))); _cfb_font_list_end = .;; }
rodata :
{
}
datas :
{
}
.note.GNU-stack :
{
  KEEP(*(.note.GNU-stack))
}
        device_states :
        {
  . = ALIGN(4);
                __device_states_start = .;
  KEEP(*(".z_devstate"));
  KEEP(*(".z_devstate.*"));
                __device_states_end = .;
  . = ALIGN(4);
        }
 log_mpsc_pbuf_area : { _log_mpsc_pbuf_list_start = .; *(SORT_BY_NAME(._log_mpsc_pbuf.static.*)); _log_mpsc_pbuf_list_end = .;; }
 log_msg_ptr_area : { _log_msg_ptr_list_start = .; KEEP(*(SORT_BY_NAME(._log_msg_ptr.static.*))); _log_msg_ptr_list_end = .;; }
 log_dynamic_area : { _log_dynamic_list_start = .; KEEP(*(SORT_BY_NAME(._log_dynamic.static.*))); _log_dynamic_list_end = .;; }
 k_timer_area : { _k_timer_list_start = .; *(SORT_BY_NAME(._k_timer.static.*)); _k_timer_list_end = .;; }
 k_mem_slab_area : { _k_mem_slab_list_start = .; *(SORT_BY_NAME(._k_mem_slab.static.*)); _k_mem_slab_list_end = .;; }
 k_heap_area : { _k_heap_list_start = .; *(SORT_BY_NAME(._k_heap.static.*)); _k_heap_list_end = .;; }
 k_mutex_area : { _k_mutex_list_start = .; *(SORT_BY_NAME(._k_mutex.static.*)); _k_mutex_list_end = .;; }
 k_stack_area : { _k_stack_list_start = .; *(SORT_BY_NAME(._k_stack.static.*)); _k_stack_list_end = .;; }
 k_msgq_area : { _k_msgq_list_start = .; *(SORT_BY_NAME(._k_msgq.static.*)); _k_msgq_list_end = .;; }
 k_mbox_area : { _k_mbox_list_start = .; *(SORT_BY_NAME(._k_mbox.static.*)); _k_mbox_list_end = .;; }
 k_pipe_area : { _k_pipe_list_start = .; *(SORT_BY_NAME(._k_pipe.static.*)); _k_pipe_list_end = .;; }
 k_sem_area : { _k_sem_list_start = .; *(SORT_BY_NAME(._k_sem.static.*)); _k_sem_list_end = .;; }
 k_event_area : { _k_event_list_start = .; *(SORT_BY_NAME(._k_event.static.*)); _k_event_list_end = .;; }
 k_queue_area : { _k_queue_list_start = .; *(SORT_BY_NAME(._k_queue.static.*)); _k_queue_list_end = .;; }
 k_fifo_area : { _k_fifo_list_start = .; *(SORT_BY_NAME(._k_fifo.static.*)); _k_fifo_list_end = .;; }
 k_lifo_area : { _k_lifo_list_start = .; *(SORT_BY_NAME(._k_lifo.static.*)); _k_lifo_list_end = .;; }
 k_condvar_area : { _k_condvar_list_start = .; *(SORT_BY_NAME(._k_condvar.static.*)); _k_condvar_list_end = .;; }
 sys_mem_blocks_ptr_area : { _sys_mem_blocks_ptr_list_start = .; *(SORT_BY_NAME(._sys_mem_blocks_ptr.static.*)); _sys_mem_blocks_ptr_list_end = .;; }
 k_obj_type_area : { _k_obj_type_list_start = .; KEEP(*(SORT_BY_NAME(._k_obj_type.static.*))); _k_obj_type_list_end = .;; }
 net_buf_pool_area : { _net_buf_pool_list_start = .; KEEP(*(SORT_BY_NAME(._net_buf_pool.static.*))); _net_buf_pool_list_end = .;; }
 /DISCARD/ : { *(.note.GNU-stack) }
native_pre_tasks :
{
 __native_tasks_start = .;
 __native_PRE_BOOT_1_tasks_start = .; KEEP(*(SORT(.native_PRE_BOOT_1[0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_1[1-9][0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_1[1-9][0-9][0-9]_task)));
 __native_PRE_BOOT_2_tasks_start = .; KEEP(*(SORT(.native_PRE_BOOT_2[0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_2[1-9][0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_2[1-9][0-9][0-9]_task)));
 __native_PRE_BOOT_3_tasks_start = .; KEEP(*(SORT(.native_PRE_BOOT_3[0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_3[1-9][0-9]_task))); KEEP(*(SORT(.native_PRE_BOOT_3[1-9][0-9][0-9]_task)));
 __native_FIRST_SLEEP_tasks_start = .; KEEP(*(SORT(.native_FIRST_SLEEP[0-9]_task))); KEEP(*(SORT(.native_FIRST_SLEEP[1-9][0-9]_task))); KEEP(*(SORT(.native_FIRST_SLEEP[1-9][0-9][0-9]_task)));
 __native_ON_EXIT_tasks_start = .; KEEP(*(SORT(.native_ON_EXIT[0-9]_task))); KEEP(*(SORT(.native_ON_EXIT[1-9][0-9]_task))); KEEP(*(SORT(.native_ON_EXIT[1-9][0-9][0-9]_task)));
 __native_tasks_end = .;
}
__data_region_end = .;
noinit :
{
}
} INSERT AFTER .data;
SECTIONS
{
 .native_sim_if.data :
 {
  KEEP(*(.native_sim_if.data));
 }
} INSERT AFTER .data;
SECTIONS
{
 .native_sim_if :
 {
  KEEP(*(.native_sim_if));
  KEEP(*(.native_sim_if.*));
 }
} INSERT AFTER .text;
