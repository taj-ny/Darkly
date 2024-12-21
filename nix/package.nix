{
  lib,
  stdenv,
  cmake,
  qtbase,
  wrapQtAppsHook,
  kwindowsystem,
  kiconthemes,
  kdecoration,
  kcoreaddons,
  kcolorscheme ? null,
  kcmutils,
  frameworkintegration,
  extra-cmake-modules,
  darkly-qt6 ? null,
}:
let
  inherit (builtins) baseNameOf;
  inherit (lib.sources) cleanSourceWith cleanSource;
  inherit (lib.strings) hasSuffix;
  isQt5 = lib.versionOlder qtbase.version "6";
in
stdenv.mkDerivation (finalAttrs: {
  pname = "darkly-qt${if isQt5 then "5" else "6"}";
  version = "0.5.7";

  src = cleanSourceWith {
    filter =
      name: _type:
      let
        baseName = baseNameOf (toString name);
      in
      !(hasSuffix ".nix" baseName);
    src = cleanSource ../.;
  };

  postInstall = lib.optionalString isQt5 ''
    rm -r $out/share
    ln -s "${darkly-qt6}/share" "$out/share"
    ln -s "${darkly-qt6}/bin" "$out/bin"
  '';

  buildInputs = [ qtbase ];

  propagatedBuildInputs =
    [
      frameworkintegration
      kcmutils
      kcoreaddons
      kdecoration
      kiconthemes
      kwindowsystem
    ]
    ++ lib.optionals (!isQt5) [
      kcolorscheme
    ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_QT5" isQt5)
    (lib.cmakeBool "BUILD_QT6" (!isQt5))
  ];

  outputs = [
    "out"
    "dev"
  ];

  meta = with lib; {
    description = "Fork of the Darkly breeze theme style that aims to be visually modern and minimalistic";
    mainProgram = "darkly-settings6";
    homepage = "https://github.com/Bali10050/Darkly";
    license = licenses.gpl2Plus;
    platforms = platforms.all;
  };
})
