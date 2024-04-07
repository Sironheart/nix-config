{pkgs, ...}: let
  catppuccinFlavour = "frappe";
in {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings =
      {
        cmake.disabled = true;
        cmd_duration = {
          min_time = 100;
          show_milliseconds = true;
        };
        directory = {
          truncation_length = 999;
          truncate_to_repo = false;
        };
        docker_context.disabled = true;
        env_var.disabled = true;
        gradle.disabled = true;
        package.disabled = true;
        status.disabled = false;
      }
      // builtins.fromTOML (
        builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          }
          + /palettes/${catppuccinFlavour}.toml)
      );
  };
}
