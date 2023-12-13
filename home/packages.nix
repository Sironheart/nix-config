{ config
, flake
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    cachix
    cocoapods
    fd
    flake.inputs.devenv.packages.${system}.devenv
    fluxcd
    gnumake
    gnupg
    htop
    jq
    k9s
    kafkactl
    kubectl
    kubernetes-helm
    kustomize
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

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
