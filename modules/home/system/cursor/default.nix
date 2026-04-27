{
  pkgs,
  lib,
  ...
}: {
  home.pointerCursor = {
    hyprcursor.enable = true;
    hyprcursor.size = 16;

    package = pkgs.bibata-cursors;

    enable = true;
    gtk.enable = true;
    x11.enable = true;

    name = "Bibata-Modern-Ice";
    size = 16;
  };
}
