{pkgs, ...}: let
  inherit (pkgs) lib;
  inherit (lib) optional optionals;
in {
  home.packages = with pkgs; [
    # general purpose
    awscli2
    aws-iam-authenticator
    fd
    gnupg
    just
    kafkactl

    # kubernetes
    kubectl
    fzf
    kubelogin

    # languages
    nodejs
    nodePackages.pnpm
    deno

    # Elixir stuff
    elixir
    elixir-ls

    # package managers
    nixVersions.latest
    asdf-vm

    # random stuff
    exercism
    geist-font
    mob

    # stuff needed for neovim
    cargo
    gh
    glab
    lua51Packages.luarocks
    php83
    php83Packages.composer
    wget
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  programs.go.enable = true;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
}
