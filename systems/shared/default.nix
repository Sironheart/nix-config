{ config
, pkgs
, ...
}: {
  imports = [
    ./desktop.nix
    ./system.nix

    ../shared/shell.nix
    ../shared/all-systems.nix
  ];

  programs.fish.enable = true;
}
