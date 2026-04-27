{config, ...}: let
  animationSpeed = "0.2";
in {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
    };
  };
}
