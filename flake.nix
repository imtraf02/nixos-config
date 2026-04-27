{
  description = ''
    Personal dotfiles for using Hyprland with QuickShell on NixOS.
    Intended to be modular for easy customizability.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      url = "github:/InioX/Matugen";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {nixpkgs, ...}: let
    system = "x86_64-linux";

    # Common module configuration
    commonModules = [
      {
        nixpkgs.overlays = [
          (final: prev: {
            fcitx5-lotus = import ./pkgs/fcitx5-lotus {
              pkgs = prev;
            };
          })
        ];
        _module.args = {inherit inputs;};
      }
      inputs.home-manager.nixosModules.home-manager
    ];

    # Helper function to create system configurations
    mkSystem = hostPath: extraPackages:
      nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          zen-browser = inputs.zen-browser.packages.${system}.default;
        };

        modules =
          commonModules
          ++ [{environment.systemPackages = extraPackages;} hostPath];
      };
  in {
    nixosConfigurations = {
      desktop =
        mkSystem ./hosts/desktop/configuration.nix [
        ];
      laptop = mkSystem ./hosts/laptop/configuration.nix [
        inputs.quickshell.packages.${system}.default
        inputs.matugen.packages.${system}.default
        inputs.antigravity-nix.packages.${system}.default
      ];
    };
  };
}
