{
  pkgs,
  lib,
  ...
}: let
  isDarwin = pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin";
in {
  home.packages = with pkgs;
    [
      # general purpose
      fd
      gnumake
      gnupg
      just
      kafkactl
      mkcert
      tldr

      # kubernetes
      kubectl

      # languages
      nodejs
      nodePackages.pnpm

      nixVersions.nix_2_21

      # random stuff
      exercism
    ]
    ++ lib.optionals isDarwin [pinentry_mac];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
