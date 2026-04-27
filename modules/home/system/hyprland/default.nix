{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: let
  border-size = "2";
  active_border = "0#ff282a36";
  gaps-in = "6";
  gaps-out = "2";
  active-opacity = "1.0";
  inactive-opacity = "0.95";
  rounding = "11";
  blur = true;
  keyboardLayout = config.var.keyboardLayout;
in {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./animations.nix
    ./bindings.nix
  ];

  home.packages = with pkgs; [
    wayland-utils
    wayland-protocols

    hyprpolkitagent
    hyprshot
    hyprpicker

    wlr-randr
    wl-clipboard

    libva
    dconf
    glib
    direnv

    meson
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      # Apps
      "$terminal" = "ghostty";
      "$browser" = "zen";
      "$editor" = "zeditor";
      "$fileExplorer" = "nautilus";

      "$kbTerminal" = "$mod, T";
      "$kbBrowser" = "$mod, W";
      "$kbEditor" = "$mod, C";
      "$kbFileExplorer" = "$mod, E";

      exec-once = [
        "dbus-update-activation-environment --systemd --all &"
        "systemctl --user start hyprpolkitagent &"
        "systemctl --user enable --now hypridle.service &"
        "hyprctl setcursor Bibata-Modern-Ice 16"
      ];

      monitor = [
        # "DP-1,2560x1440@240,auto,1" # Primary monitor
        # ",prefered,auto,1" # Default everything
        ",1920x1080,auto,1"
      ];

      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"

        "ELECTRON_OZONE_PLATFORM_HINT,wayland"

        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "EDITOR,zed"

        "TERMINAL,ghostty"
        "XDG_TERMINAL_EMULATOR,ghostty"
      ];

      cursor = {
        no_hardware_cursors = true;
        default_monitor = "DP-1";
      };

      general = {
        resize_on_border = true;
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        layout = "dwindle";
        "col.active_border" = active_border;
      };

      decoration = {
        active_opacity = active-opacity;
        inactive_opacity = inactive-opacity;
        rounding = rounding;
        shadow = {
          enabled = true;
          range = 8;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 6;
        };
      };

      master = {
        new_status = true;
        allow_small_split = true;
        mfact = 0.5;
      };

      dwindle = {
        preserve_split = true;
      };

      gestures = {};

      misc = {
        vfr = true;
        vrr = 1;

        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = false;

        focus_on_activate = true;

        middle_click_paste = false;
      };

      input = {
        kb_layout = keyboardLayout;

        # Allow scroll wheel press for scrolling.
        scroll_method = "on_button_down";
        scroll_button = 274;

        follow_mouse = 1;
        sensitivity = 1;
        repeat_delay = 300;
        repeat_rate = 50;
      };
    };
  };
}
