{ inputs, pkgs, ... }:
let
  devenv = inputs.devenv.packages.${pkgs.system}.devenv;
in
{
  home.packages = with pkgs; [
    # devenv
    cachix
    devenv

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
    terraform

    # language tooling
    cargo
    delve #Golang Debugging Tool
    nil
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
