{ config
, flake
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # devenv
    cachix
    flake.inputs.devenv.packages.${system}.devenv

    # general purpose
    fd
    gnumake
    gnupg
    htop
    jq
    just
    kafkactl
    mkcert
    pinentry_mac
    ripgrep

    # kubernetes
    k9s
    kubectl
    kubernetes-helm
    kustomize

    # languages
    go
    nodejs
    nodePackages.pnpm
    ruby
    terraform

    # language tooling
    cocoapods
    cargo
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
