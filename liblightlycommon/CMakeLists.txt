################# dependencies #################
### Qt/KDE
find_package(Qt${QT_MAJOR_VERSION} REQUIRED CONFIG COMPONENTS Widgets)

################# lightlystyle target #################
set(lightlycommon_LIB_SRCS
    lightlyboxshadowrenderer.cpp
)

add_library(lightlycommon${QT_MAJOR_VERSION} ${lightlycommon_LIB_SRCS})

generate_export_header(lightlycommon${QT_MAJOR_VERSION}
    BASE_NAME lightlycommon
    EXPORT_FILE_NAME lightlycommon_export.h)

target_link_libraries(lightlycommon${QT_MAJOR_VERSION}
    PUBLIC
    Qt${QT_MAJOR_VERSION}::Core
    Qt${QT_MAJOR_VERSION}::Gui
    Qt${QT_MAJOR_VERSION}::Widgets

    KF${QT_MAJOR_VERSION}::GuiAddons
    KF${QT_MAJOR_VERSION}::ConfigCore
    KF${QT_MAJOR_VERSION}::ConfigGui
    KF${QT_MAJOR_VERSION}::IconThemes
    KF${QT_MAJOR_VERSION}::I18n)

set_target_properties(lightlycommon${QT_MAJOR_VERSION} PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})


install(TARGETS lightlycommon${QT_MAJOR_VERSION} ${KDE_INSTALL_TARGETS_DEFAULT_ARGS} LIBRARY NAMELINK_SKIP)
