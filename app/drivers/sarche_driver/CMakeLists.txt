if(CONFIG_SARCHE_DRIVER)
    target_sources(app PRIVATE sarche_driver.c)
    target_include_directories(app PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
endif()