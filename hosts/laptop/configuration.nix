{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    ./services.nix
    ./users.nix
    ./system.nix

    ../../modules/core
  ];
}
