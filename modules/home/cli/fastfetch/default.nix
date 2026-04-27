{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "fastfetch/config.jsonc" = {
      source = ./config.jsonc;
    };
  };
}
