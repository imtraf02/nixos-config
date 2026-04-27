{
  config,
  inputs,
  ...
}: let
  autoGarbageCollector = config.var.autoGarbageCollector;
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [];
      trusted-public-keys = [];
    };

    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
