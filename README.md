
# About this fork

This fork attempts to revive lightly with a different approach from boehs, with the assumption that Luwx won't ever resume his project.

This means that this fork allows real changes, and not just maintainence.

![Lightly](https://github.com/user-attachments/assets/ae39fc7f-8277-48b1-b80c-9e307542b8b0)


## The to-do list

- [x] Make a new readme
- [x] Make install work on plasma 6
- [ ] Find some people that can help with this project
- [ ] Build some community
- [ ] Make some meaningful commits
- [ ] Expand to-do list

## Installation

### Dependencies


#### For Arch Linux
```
sudo pacman -S cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras kcoreaddons kcmutils kcolorscheme kconfig kguiaddons kiconthemes kwindowsystem
```

<details>
<summary><h4>For other distros I have not tested it on</h4></summary>

#### Ubuntu
```
sudo apt install cmake build-essential libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev extra-cmake-modules libkf5guiaddons-dev libkf5configwidgets-dev libkf5kcmutils-dev libkf5windowsystem-dev libkf5coreaddons-dev libkf5iconthemes-dev gettext qt3d5-dev
```

#### Fedora

#####  The system must first be up to date

```
sudo dnf up --refresh
```

#####  Fedora 40

#### Install the required dependencies

```
sudo dnf install cmake extra-cmake-modules "cmake(Qt5Core)" "cmake(Qt5Gui)" "cmake(Qt5DBus)" "cmake(Qt5X11Extras)" "cmake(KF5GuiAddons)" "cmake(KF5WindowSystem)" "cmake(KF5I18n)" "cmake(KDecoration2)" "cmake(KF5CoreAddons)" "cmake(KF5ConfigWidgets)" "cmake(Qt5UiTools)" "cmake(KF5GlobalAccel)" "cmake(KF5IconThemes)" kwin-devel libepoxy-devel "cmake(KF5Init)" "cmake(KF5Crash)" "cmake(KF5KIO)" "cmake(KF5Notifications)" kf5-kpackage-devel kf6-kcolorscheme-devel kf6-kguiaddons-devel kf6-ki18n-devel kf6-kiconthemes-devel kf6-kirigami-devel kf6-frameworkintegration-devel kf6-kcmutils-devel kf5-kcmutils-devel kf5-frameworkintegration-devel
```

#####  Fedora 39

```
sudo dnf install cmake extra-cmake-modules "cmake(Qt5Core)" "cmake(Qt5Gui)" "cmake(Qt5DBus)" "cmake(Qt5X11Extras)" "cmake(KF5GuiAddons)" "cmake(KF5WindowSystem)" "cmake(KF5I18n)" "cmake(KDecoration2)" "cmake(KF5CoreAddons)" "cmake(KF5ConfigWidgets)" "cmake(Qt5UiTools)" "cmake(KF5GlobalAccel)" "cmake(KF5IconThemes)" kwin-devel libepoxy-devel "cmake(KF5Init)" "cmake(KF5Crash)" "cmake(KF5KIO)" "cmake(KF5Notifications)" kf5-kpackage-devel
```


#### Build & install

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib64 -DBUILD_TESTING=OFF ..
cd ./kdecoration/config/
make
cd ../../
make
sudo make install
```

#### openSUSE
```
sudo zypper install cmake gcc-c++ extra-cmake-modules libQt5Gui-devel libQt5DBus-devel libqt5-qttools-devel libqt5-qtx11extras-devel libQt5OpenGL-devel libQt5Network-devel libepoxy-devel kconfig-devel kconfigwidgets-devel kcrash-devel kglobalaccel-devel ki18n-devel kio-devel kservice-devel kinit-devel knotifications-devel kwindowsystem-devel kguiaddons-devel kiconthemes-devel kpackage-devel kwin5-devel xcb-util-devel xcb-util-cursor-devel xcb-util-wm-devel xcb-util-keysyms-devel
```

#### Solus
```
sudo eopkg install extra-cmake-modules kdecoration-devel qt5-declarative-devel qt5-x11extras-devel qt5-base-devel kcoreaddons-devel kguiaddons-devel kconfigwidgets-devel kwindowsystem-devel ki18n-devel kiconthemes-devel kcmutils-devel libxcb-devel xcb-util-devel qt5-wayland-devel kwayland-devel wayland-devel frameworkintegration-devel
```
</details>

> [!IMPORTANT]
> These have not been tested yet, just copied them from the original. If you want to help without programming knowledge, you can confirm if one works or not, and if not, you can help expand the dependency list to make it work for everyone using your distro


### Build and install

```
git clone --single-branch --depth=1 https://github.com/Bali10050/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
cd ./kdecoration/config/
make
cd ../../
make
sudo make install
```
