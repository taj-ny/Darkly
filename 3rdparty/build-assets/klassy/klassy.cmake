set(KLASSY_TAG "6.2.breeze6.2.1")
set(KLASSY_PREFIX "klassy")
set(KLASSY_DESTDIR ${CMAKE_CURRENT_BINARY_DIR}/klassy/bin)
include(ECMSetupVersion)
include(ExternalProject)

# patch klassy CMakeLists.txt since it contains QT5 references

if(KLASSY_DECORATIONS)
    message("Klassy decorations build -- ON")
    ExternalProject_Add(
        ${KLASSY_PREFIX}
        URL "https://github.com/paulmcauley/${KLASSY_PREFIX}/archive/refs/tags/${KLASSY_TAG}.tar.gz"
        PREFIX ${KLASSY_PREFIX}
        DOWNLOAD_EXTRACT_TIMESTAMP false
        SOURCE_DIR "${CMAKE_SOURCE_DIR}/3rdparty/${KLASSY_PREFIX}"
        PATCH_COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/3rdparty/build-assets/klassy/CMakeLists.txt <SOURCE_DIR>/CMakeLists.txt
        INSTALL_COMMAND make DESTDIR=${KLASSY_DESTDIR} install
    )

    set(CMAKECONFIG_INSTALL_DIR "${KDE_INSTALL_CMAKEPACKAGEDIR}/Klassy")

    install(DIRECTORY ${KLASSY_DESTDIR}/${CMAKE_INSTALL_PREFIX}/ DESTINATION ".")

    # create a Config.cmake and a ConfigVersion.cmake file and install them

    ecm_setup_version(${PROJECT_VERSION} VARIABLE_PREFIX BREEZE
                        PACKAGE_VERSION_FILE "${CMAKE_CURRENT_BINARY_DIR}/KlassyConfigVersion.cmake"
    )
    #set(CMAKECONFIG_INSTALL_DIR "${KDE_INSTALL_CMAKEPACKAGEDIR}/Klassy")

    configure_package_config_file("${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/build-assets/${KLASSY_PREFIX}/KlassyConfig.cmake.in"
                                    "${CMAKE_CURRENT_BINARY_DIR}/KlassyConfig.cmake"
                                    PATH_VARS KDE_INSTALL_FULL_DATADIR
                                    INSTALL_DESTINATION  ${CMAKECONFIG_INSTALL_DIR}
    )
    install(FILES  "${CMAKE_CURRENT_BINARY_DIR}/KlassyConfig.cmake"
            "${CMAKE_CURRENT_BINARY_DIR}/KlassyConfigVersion.cmake"
        DESTINATION "${CMAKECONFIG_INSTALL_DIR}"
        COMPONENT Devel
    )
else()
    message("Klassy decorations build -- OFF")
endif()


