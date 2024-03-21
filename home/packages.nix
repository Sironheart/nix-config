{
  inputs,
  pkgs,
  ...
}: let
  devenv = inputs.devenv.packages.${pkgs.system}.devenv;
in {
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

    # languages
    nodejs
    nodePackages.pnpm

    nixVersions.nix_2_21
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
