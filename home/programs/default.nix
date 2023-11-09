{ config
, pkgs
, flake
, ...
}:
{
  imports = [
    ./git
    ./nvim
    ./shell
  ];
}
