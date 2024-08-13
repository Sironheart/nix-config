{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;

    config = {
      whitelist = {
        prefix = ["~/privat" "~/projects"];
      };
    };
  };

  home.file.".config.direnv/lib/use_asdf.sh".text = ''
    use_asdf() {
      source_env "$(asdf direnv envrc "$0")"
    }
  '';
}
