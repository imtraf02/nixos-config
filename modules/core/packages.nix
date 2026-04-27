{
  pkgs,
  lib,
  zen-browser,
  ...
}: {
  programs = {
    firefox.enable = false;

  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zen-browser
    pkg-config
    gtk3
    gtk4
    openssl
  ];

  environment.variables = {
  };
}
