{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      shell = {
        args = [ "-l" ];
        program = "${pkgs.fish}/bin/fish";
      };
      window = {
        blur = true;
        decorations = "Buttonless";
        opacity = 0.6;
        option_as_alt = "Both";
        startup_mode = "SimpleFullscreen";
      };
      font = {
        normal = {
          family = "JetbrainsMono Nerd Font";
        };
        size = 13;
      };
      selection.save_to_clipboard = true;

      # oxocarbon colors 
      colors = {
        primary = {
          background = "#161616";
          foreground = "#ffffff";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#ee5396";
          };
        };
        normal = {
          black = "#262626";
          magenta = "#ff7eb6";
          green = "#42be65";
          yellow = "#ffe97b";
          blue = "#33b1ff";
          red = "#ee5396";
          cyan = "#3ddbd9";
          white = "#dde1e6";
        };
        bright = {
          black = "#393939";
          magenta = "#ff7eb6";
          green = "#42be65";
          yellow = "#ffe97b";
          blue = "#33b1ff";
          red = "#ee5396";
          cyan = "#3ddbd9";
          white = "#ffffff";
        };
      };
    };
  };
}
