{pkgs, ...}: {
  home.packages = with pkgs; [
    # general purpose
    awscli2
    fd
    ffmpeg
    gnupg
    just

    # kubernetes
    kubectl
    fzf
    kubelogin
    kubernetes-helm

    # languages
    nodejs
    nodePackages.pnpm
    deno

    # package managers
    nixVersions.latest
    asdf-vm

    # random stuff
    exercism
    geist-font
    mob

    # stuff needed for neovim
    gh
    glab
    php83
    php83Packages.composer
    wget
    imagemagick
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  programs.go.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
}
