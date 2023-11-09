{ config
, flake
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    aws-iam-authenticator
    cachix
    cocoapods
    flake.inputs.devenv.packages.${system}.devenv
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
    ripgrep
    ruby
    rustup
    terraform
    wget
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
