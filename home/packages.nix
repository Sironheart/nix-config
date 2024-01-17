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
    just
    kafkactl
    mkcert
    pinentry_mac

    # kubernetes
    kubectl
    kubernetes-helm
    kustomize

    # languages
    nodejs
    nodePackages.pnpm
    ruby
    terraform

    # language tooling
    cocoapods
    cargo
    delve #Golang Debugging Tool
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
