{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;

    config = {
      whitelist = {
        prefix = [ "~/privat" "~/projects" ];
      };
    };
  };
}
