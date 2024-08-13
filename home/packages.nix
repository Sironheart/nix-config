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

    nixVersions.nix_2_22
    asdf-vm

    # random stuff
    exercism
    geist-font
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
