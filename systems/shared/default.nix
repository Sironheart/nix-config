{ config
, pkgs
, ...
}: {
  imports = [
    ./all-systems.nix
    ./shell.nix
  ];

  programs.fish.enable = true;
}
