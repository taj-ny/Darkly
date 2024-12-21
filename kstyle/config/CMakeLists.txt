### configuration plugin
add_definitions(-DTRANSLATION_DOMAIN=\"darkly_style_config\")
set(kstyle_darkly_config_PART_SRCS darklystyleconfig.cpp)

set(kstyle_darkly__config_PART_SRCS ${kstyle_darkly_config_PART_SRCS} darklystyleconfigmodule.cpp)

kconfig_add_kcfg_files(kstyle_darkly_config_PART_SRCS ../darklystyleconfigdata.kcfgc)
set(kstyle_darkly_config_PART_FORMS ui/darklystyleconfig.ui)
ki18n_wrap_ui(kstyle_darkly_config_PART_FORMS_HEADERS ${kstyle_darkly_config_PART_FORMS})

kcoreaddons_add_plugin(darklystyleconfig SOURCES
    ${kstyle_darkly_config_PART_SRCS}
    ${kstyle_darkly_config_PART_FORMS_HEADERS}
    INSTALL_NAMESPACE "kstyle_config"
)

target_link_libraries(darklystyleconfig Qt6::Core Qt6::Gui Qt6::Widgets Qt6::DBus)
target_link_libraries(darklystyleconfig KF6::CoreAddons KF6::ConfigCore KF6::ConfigWidgets KF6::I18n)
if(QT_MAJOR_VERSION STREQUAL "6")
    target_link_libraries(darklystyleconfig KF6::KCMUtils)
endif()
kcmutils_generate_desktop_file(darklystyleconfig)

set(darkly_settings_SOURCES main.cpp)
add_executable(darkly-settings ${darkly_settings_SOURCES} )
target_link_libraries(darkly-settings Qt6::Core Qt6::Gui Qt6::Widgets )
target_link_libraries(darkly-settings KF6::I18n KF6::KCMUtils KF6::CoreAddons)

set_target_properties(darkly-settings PROPERTIES OUTPUT_NAME darkly-settings${QT_MAJOR_VERSION})

install(TARGETS darkly-settings ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})

# icon
ecm_install_icons(ICONS sc-apps-darkly-settings.svgz
    DESTINATION ${KDE_INSTALL_ICONDIR}
    THEME hicolor )


