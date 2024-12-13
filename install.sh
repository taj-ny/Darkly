#!/bin/env bash

sed -i "s/_versionNumber->setText(.*.);/_versionNumber->setText(\"$(basename "`pwd`"\"));/" ./kstyle/config/lightlystyleconfig.cpp

QT_BUILD=$1
SRC_DIR=$(pwd)
BUILD_DIR="$SRC_DIR/build"
CMAKE_OPTS=(
    -B $BUILD_DIR
    -S $SRC_DIR
    -DBUILD_TESTING=OFF
    -Wno-dev
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
)
PROJECT="lightly"
_PROJECT="Lightly"

build_qt6() {
    echo " *** Building with QT6 *** "
    remove_build
    remove_qt6_files
    cmake "${CMAKE_OPTS[@]}" -DBUILD_QT6=ON -DBUILD_QT5=OFF && cmake --build $BUILD_DIR -j $(nproc) && cd $BUILD_DIR && sudo cmake --install . && echo "Installation completed!" || echo "Installation failed!" && exit 1
    cd "$SRC_DIR"
}

build_qt5() {
    echo " *** Building with QT5 *** "
    remove_build
    remove_qt5_files
    cmake "${CMAKE_OPTS[@]}" -DBUILD_QT6=OFF -DBUILD_QT5=ON && cmake --build $BUILD_DIR -j $(nproc) && cd $BUILD_DIR && sudo cmake --install . && echo "Installation completed!" || echo "Installation failed!" && exit 1
    cd "$SRC_DIR"
}

# build using QT5 and QT6
build_default() {
    echo " *** Building with QT5 && QT6 *** "
    remove_build
    remove_qt5_files
    remove_qt6_files
    cmake "${CMAKE_OPTS[@]}" && cmake --build $BUILD_DIR -j $(nproc) && cd $BUILD_DIR && sudo cmake --install . && echo "Installation completed!" || echo "Installation failed!" && exit 1
    cd "$SRC_DIR"
}

remove_build() {
    if [ -d "$SRC_DIR/build" ]; then
        echo "Removing existing build directory"
        sudo rm -rf $SRC_DIR/build
    fi

    cd "$SRC_DIR"
}

# if existing
remove_qt6_files() {
    files=(
        "/usr/lib64/qt6/plugins/styles/${PROJECT}6.so"
        "/usr/lib/qt6/plugins/styles/${PROJECT}6.so"
        "/usr/share/kstyle/themes/${PROJECT}.themerc"
        "/usr/lib64/qt6/plugins/kstyle_config/${PROJECT}styleconfig.so"
        "/usr/lib/qt6/plugins/kstyle_config/${PROJECT}styleconfig.so"
        "/usr/share/applications/${PROJECT}styleconfig.desktop"
        "/usr/bin/${PROJECT}-settings6"
        "/usr/share/icons/hicolor/scalable/apps/${PROJECT}-settings.svgz"
        "/usr/lib64/lib${PROJECT}common6.so.6.80"
        "/usr/lib/lib${PROJECT}common6.so.6.80"
        "/usr/lib64/lib${PROJECT}common6.so.6"
        "/usr/lib/lib${PROJECT}common6.so.6"
        "/usr/lib64/qt6/plugins/org.kde.kdecoration2/org.kde.${PROJECT}.so"
        "/usr/lib/qt6/plugins/org.kde.kdecoration2/org.kde.${PROJECT}.so"
        "/usr/lib64/qt6/plugins/org.kde.kdecoration2.kcm/kcm_${PROJECT}decoration.so"
        "/usr/lib/qt6/plugins/org.kde.kdecoration2.kcm/kcm_${PROJECT}decoration.so"
        "/usr/share/applications/kcm_${PROJECT}decoration.desktop"
        "/usr/lib64/cmake/${PROJECT}/${PROJECT}Config.cmake"
        "/usr/lib/cmake/${PROJECT}/${PROJECT}Config.cmake"
        "/usr/lib64/cmake/${PROJECT}/${PROJECT}ConfigVersion.cmake"
        "/usr/lib/cmake/${PROJECT}/${PROJECT}ConfigVersion.cmake"
        "/usr/share/color-schemes/${_PROJECT}.colors"
        /usr/lib/cmake/"${PROJECT^}"
        "/usr/lib/x86_64-linux-gnu/qt6/plugins/org.kde.kdecoration2/org.kde.${PROJECT}.so"
        "/usr/lib/x86_64-linux-gnu/qt6/plugins/kstyle_config/${PROJECT}styleconfig.so"
        "/usr/lib/x86_64-linux-gnu/qt6/plugins/org.kde.kdecoration2.kcm/kcm_${PROJECT}decoration.so"
        "/usr/lib/x86_64-linux-gnu/qt6/plugins/styles/${PROJECT}6.so"
    )

    for f in ${files[@]}; do
        sudo rm -rf "$f"
    done
}

# if existing
remove_qt5_files() {
    files=(
        "/usr/lib64/qt5/plugins/styles/${PROJECT}5.so"
        "/usr/lib/qt5/plugins/styles/${PROJECT}5.so"
        "/usr/lib64/lib${PROJECT}common5.so.6.80"
        "/usr/lib/lib${PROJECT}common5.so.6.80"
        "/usr/lib64/lib${PROJECT}common5.so.6"
        "/usr/lib/lib${PROJECT}common5.so.6"
        "/usr/lib64/qt/plugins/styles/${PROJECT}5.so"
        "/usr/lib/x86_64-linux-gnu/qt5/plugins/styles/${PROJECT}5.so"
    )

    for f in ${files[@]}; do
        sudo rm -rf "$f"
    done
}

case "$QT_BUILD" in
qt5 | QT5)
    build_qt5
    ;;
qt6 | QT6)
    build_qt6
    ;;
remove)
    remove_qt5_files
    remove_qt6_files
    ;;
*)
    build_default
    ;;
esac
