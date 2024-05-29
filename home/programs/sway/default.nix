{
  pkgs,
  config,
  ...
}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;

  modifier = config.wayland.windowManager.sway.config.modifier;
in {
  wayland.windowManager.sway = {
    enable = isLinux;

    systemd = {
      enable = true;
      xdgAutostart = true;
    };

    extraConfig = ''
      default_border pixel 1
    '';

    config = {
      terminal = "${pkgs.alacritty}/bin/alacritty";

      startup = [
        {command = "${pkgs.alacritty}/bin/alacritty";}
      ];

      modifier = "Mod4";
      up = "k";
      down = "j";
      left = "h";
      right = "l";

      keybindings = {
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

  programs.waybar = {
    enable = true;
    systemd.target = "sway-session.target";
  };
  programs.alacritty = {
    enable = isLinux;
  };
  programs.swaylock.enable = isLinux;

  services.swayidle.enable = isLinux;
}
