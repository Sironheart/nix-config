{ config
, pkgs
, ...
}: {
  imports = [
    ./all-systems.nix
    ./shell.nix
  ];
}
