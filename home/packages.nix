{pkgs, ...}: {
  home.packages = with pkgs; [
    # general purpose
    awscli2
    aws-iam-authenticator
    fd
    gnumake
    gnupg
    just
    kafkactl
    mkcert
    tldr

    # kubernetes
    kubectl
    fzf
    kubelogin

    # languages
    nodejs
    nodePackages.pnpm
    ocaml
    opam
    dune_3

    # package managers
    nixVersions.latest
    asdf-vm

    # random stuff
    exercism
    geist-font

    # stuff needed for neovim
    cargo
    gh
    glab
    lua51Packages.luarocks
    php84
    php84Packages.composer
    wget
  ];

  home.stateVersion = "24.05";
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
