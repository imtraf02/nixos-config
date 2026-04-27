{
  options,
  pkgs,
  ...
}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Core system libraries
      stdenv.cc.cc.lib
      glib
      dbus
      dbus-glib
      expat
      libelf

      # Security & cryptography
      nspr
      nss
      openssl

      # Printing
      cups

      # GUI toolkit libraries
      libdbusmenu-gtk3
      gtk3
      atk
      gdk-pixbuf
      pango
      cairo

      # Graphics & rendering
      libdrm
      mesa
      libGL
      libva
      libgbm

      # Input handling
      libxkbcommon

      # Audio
      alsa-lib
      pipewire

      # Font rendering
      fontconfig
      freetype

      # X11 core libraries
      libx11
      libxcb
      libxext
      libxfixes
      libxi
      libxtst
      libxrender

      # X11 window management
      libxcomposite
      libxdamage
      libxrandr
      libxinerama
      libxcursor
      libxscrnsaver

      # X11 graphics extensions
      libxxf86vm
      libxshmfence

      # X11 session management
      libsm
      libice
    ];
  };
}
