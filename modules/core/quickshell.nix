{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default

    qt6.qtbase
    qt6.qtmultimedia

    kdePackages.qtdeclarative
  ];

  environment.variables = {
    QML_IMPORT_PATH = builtins.concatStringsSep ":" [
      "${pkgs.qt6.qtmultimedia}/lib/qt-6/qml"
      "${pkgs.qt6.qtbase}/lib/qt-6/qml"
    ];

    QML2_IMPORT_PATH = builtins.concatStringsSep ":" [
      "${pkgs.qt6.qtmultimedia}/lib/qt-6/qml"
      "${pkgs.qt6.qtbase}/lib/qt-6/qml"
    ];
  };
}
