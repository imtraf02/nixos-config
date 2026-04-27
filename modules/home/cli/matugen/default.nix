{inputs, ...}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = false;
  };
}
