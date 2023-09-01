{ config
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    aws-iam-authenticator
    awscli2
    cocoapods
    gnupg
    htop
    jq
    k9s
    kafkactl
    kubectl
    kubernetes-helm
    kustomize
    gnumake
    mkcert
    nixpkgs-fmt
    nodejs
    nodePackages.pnpm
    pinentry_mac
    ruby
    terraform
    wget
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
