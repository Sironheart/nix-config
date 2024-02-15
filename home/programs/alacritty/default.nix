{ pkgs
, ...
}:
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
        size = 14;
      };
      selection.save_to_clipboard = true;

      colors = {
        # Default colors
        primary = {

          background = "0x282726";
          foreground = "0xFFFCF0";

          dim_foreground = "0xFFFCF0";
          bright_foreground = "0xFFFCF0";
        };

        # Cursor colors
        cursor = {
          text = "0xFFFCF0";
          cursor = "0xFFFCF0";
        };
        # Normal colors
        normal = {
          black = "0x100F0F";
          red = "0xAF3029";
          green = "0x66800B";
          yellow = "0xAD8301";
          blue = "0x205EA6";
          magenta = "0xA02F6F";
          cyan = "0x24837B";
          white = "0xFFFCF0";
        };

        # Bright colors
        bright = {
          black = "0x100F0F";
          red = "0xD14D41";
          green = "0x879A39";
          yellow = "0xD0A215";
          blue = "0x4385BE";
          magenta = "0xCE5D97";
          cyan = "0x3AA99F";
          white = "0xFFFCF0";
        };
        # Dim colors
        dim = {
          black = "0x100F0F";
          red = "0xAF3029";
          green = "0x66800B";
          yellow = "0xAD8301";
          blue = "0x205EA6";
          magenta = "0xA02F6F";
          cyan = "0x24837B";
          white = "0xFFFCF0";
        };
      };
    };
  };
}
