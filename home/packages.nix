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

    # package managers
    nixVersions.nix_2_23
    asdf-vm

    # random stuff
    exercism
    geist-font

    # stuff needed for neovim
    cargo
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
