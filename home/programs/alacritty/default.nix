{pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings =
      {
        shell = {
          args = ["-l"];
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
      }
      // builtins.fromTOML (builtins.readFile ../../../config/alacritty.toml);
  };
}
