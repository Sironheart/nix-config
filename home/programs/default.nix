{ config
, pkgs
, flake
, ...
}:
{
  imports = [
    ./git
    ./nixvim
    ./shell
  ];
}
