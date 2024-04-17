{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
  inherit (lib) optionals;
  inherit (stdenv) isDarwin;
in {
  home.packages = with pkgs;
    [
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

      # languages
      nodejs
      nodePackages.pnpm

      nixVersions.nix_2_22

      # random stuff
      exercism
      geist-font
      krabby
    ]
    ++ optionals isDarwin [pinentry_mac];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
