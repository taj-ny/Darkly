################# dependencies #################
### Qt/KDE
find_package(Qt${QT_MAJOR_VERSION} REQUIRED CONFIG COMPONENTS Widgets)

################# darklystyle target #################
set(darklycommon_LIB_SRCS
    darklyboxshadowrenderer.cpp
)

add_library(darklycommon${QT_MAJOR_VERSION} ${darklycommon_LIB_SRCS})

generate_export_header(darklycommon${QT_MAJOR_VERSION}
    BASE_NAME darklycommon
    EXPORT_FILE_NAME darklycommon_export.h)

target_link_libraries(darklycommon${QT_MAJOR_VERSION}
    PUBLIC
    Qt${QT_MAJOR_VERSION}::Core
    Qt${QT_MAJOR_VERSION}::Gui
    Qt${QT_MAJOR_VERSION}::Widgets

    KF${QT_MAJOR_VERSION}::GuiAddons
    KF${QT_MAJOR_VERSION}::ConfigCore
    KF${QT_MAJOR_VERSION}::ConfigGui
    KF${QT_MAJOR_VERSION}::IconThemes
    KF${QT_MAJOR_VERSION}::I18n)

set_target_properties(darklycommon${QT_MAJOR_VERSION} PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})


install(TARGETS darklycommon${QT_MAJOR_VERSION} ${KDE_INSTALL_TARGETS_DEFAULT_ARGS} LIBRARY NAMELINK_SKIP)
