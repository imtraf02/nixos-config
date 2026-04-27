{
  config,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821ce
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.blacklistedKernelModules = [
    "rtw88_8821ce"
    "rtw88_8821c"
  ];

  nix.settings = {
    download-buffer-size = 134217728;
  };

  nix.package = pkgs.nixVersions.latest;

  services.gvfs.enable = true;

  home-manager.users = {
    imtraf = import ../../home/imtraf/home.nix;
    underdel = import ../../home/underdel/home.nix;
  };

  system.stateVersion = "25.11";
}
