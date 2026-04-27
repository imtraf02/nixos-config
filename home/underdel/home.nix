{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    ../../modules/home/apps/zen-browser

    ../../modules/home/system/cursor
    ../../modules/home/system/gtk

  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/${config.var.username}";
    stateVersion = "25.11"; # Don't touch this

    packages = with pkgs; [
    ];
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  # Enable Home Manager (can be omitted - enabled by default)
  programs.home-manager.enable = true;
}
