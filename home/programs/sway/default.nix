{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;

  modifier = "Mod4";
in {
  wayland.windowManager.sway = {
    enable = isLinux;

    wrapperFeatures.gtk = true;
    systemd.xdgAutostart = true;
    xwayland = true;

    config = {
      inherit modifier;

      terminal = "${pkgs.alacritty}/bin/alacritty";

      startup = [
        {command = "systemctl --user restart waybar"; always = true;}
        {command = "${pkgs.alacritty}/bin/alacritty";}
        {command = "firefox";}
      ];

      up = "k";
      down = "j";
      left = "h";
      right = "l";

      keybindings = {
        "${modifier}+Return" = "exec --no-startup-id ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+Tab" = "exec ${pkgs.swayr}/bin/swayr switch-window";
        "${modifier}+Shift+d" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes' 'swaymsg exit";

        # Move your focus around
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        # Or use ${modifier}+[up|down|left|right]
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        # Move the focused window with the same, but add Shift
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        # Ditto, with arrow keys
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        # Workspaces:
        # Switch to workspace
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        # Move focused container to workspace
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
      };

      colors = {
        background = "#ffffff";
        focused = {
          background = "#5f676a";
          border = "#999999";
          childBorder = "#999999";
          indicator = "#999999";
          text = "#999999";
        };
        focusedInactive = {
          background = "#5f676a";
          border = "#999999";
          childBorder = "#999999";
          indicator = "#999999";
          text = "#999999";
        };
        urgent = {
          background = "#5f676a";
          border = "#999999";
          childBorder = "#999999";
          indicator = "#999999";
          text = "#999999";
        };

        unfocused = {
          background = "#222222";
          border = "#999999";
          childBorder = "#1f1e1e";
          indicator = "#292d2e";
          text = "#888888";
        };

        placeholder = {
          background = "#0c0c0c";
          border = "#000000";
          childBorder = "#0c0c0c";
          indicator = "#000000";
          text = "#ffffff";
        };
      };
    };
  };

  programs.waybar.enable = isLinux;
  programs.alacritty.enable = isLinux;
  programs.swaylock.enable = isLinux;
  programs.firefox.enable = isLinux;

  services.swayidle.enable = isLinux;
}
