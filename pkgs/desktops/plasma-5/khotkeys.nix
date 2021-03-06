{
  mkDerivation, lib,
  extra-cmake-modules, kdoctools,
  qtbase,
  kcmutils, kdbusaddons, kdelibs4support, kglobalaccel, ki18n, kio, kxmlgui,
  plasma-framework, plasma-workspace, qtx11extras
}:

mkDerivation {
  name = "khotkeys";
  nativeBuildInputs = [ extra-cmake-modules kdoctools ];
  buildInputs = [
    kcmutils kdbusaddons kdelibs4support kglobalaccel ki18n kio kxmlgui
    plasma-framework plasma-workspace qtx11extras
  ];
  outputs = [ "bin" "dev" "out" ];
  meta.broken = lib.versionOlder qtbase.version "5.14";
}
