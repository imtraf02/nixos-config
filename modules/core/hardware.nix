{pkgs, ...}: {
  services.xserver.videoDrivers = ["modesetting"];

  environment.systemPackages = with pkgs; [
    mesa # OpenGL support for VMs
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };
  };
}
