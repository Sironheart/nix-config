{ config
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    aws-iam-authenticator
    cargo
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
    rustc
    terraform
    wget
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
