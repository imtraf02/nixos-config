{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    ../../modules/home/apps/zen-browser
    ../../modules/home/apps/zed
    ../../modules/home/apps/obs-studio

    ../../modules/home/cli/fastfetch
    ../../modules/home/cli/git
    ../../modules/home/cli/yazi
    ../../modules/home/cli/matugen

    ../../modules/home/shells/bash
    ../../modules/home/shells/bat
    ../../modules/home/shells/fish-shell
    ../../modules/home/shells/oh-my-posh

    ../../modules/home/system/noctalia-shell
    ../../modules/home/system/cursor

    ../../modules/home/system/niri

    ../../modules/home/terminals/ghostty
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/${config.var.username}";
    stateVersion = "25.11";

    packages = with pkgs; [
      code-cursor
      discord
      pear-desktop
      vscode
      zed-editor

      nodejs_25
      bun
      yarn
      pnpm
      biome
      python3
      rustc
      rust-analyzer
      rustfmt
      cargo
      clippy

      git
      git-credential-manager
      grc
      zip
      unzip
      tree
      btop
      fastfetch
      bat
      yazi
      app2unit

      fish
      oh-my-posh

      gtk4
      libgtkflow4

      cava
      bluez
      ddcutil
      brightnessctl
      imagemagick

      alejandra
      direnv

      pciutils
      mesa-demos
      google-chrome
      qwen-code
      gemini-cli
    ];
  };

  programs.home-manager.enable = true;
}
