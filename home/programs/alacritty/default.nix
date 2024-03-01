{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "-l" ];
      };
      window = {
        decorations = "Buttonless";
        opacity = 0.8;
        blur = true;
        startup_mode = "SimpleFullscreen";
        option_as_alt = "Both";
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
