{ config
, pkgs
, ...
}:
{
  imports = [
    ./programs
    ./packages.nix
  ];
}
