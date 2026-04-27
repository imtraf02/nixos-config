{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.ling.homeModules.default
  ];

  programs.ling-shell = {
    enable = true;
    # systemd.enable = true;
  };
}
