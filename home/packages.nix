{ config
, pkgs
, ...
}:
{
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
    nixd
    nixpkgs-fmt
    nodejs
    nodePackages.pnpm
    pinentry_mac
    ruby
    terraform
    wget
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
