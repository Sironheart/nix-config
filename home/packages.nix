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

    # package managers
    nixVersions.latest
    asdf-vm

    # random stuff
    geist-font

    # stuff needed for neovim
    gh
    glab
    wget
    imagemagick
  ];

  home.stateVersion = "25.05";
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
