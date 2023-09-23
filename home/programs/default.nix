{ config
, pkgs
, flake
, ...
}:
{
  imports = [
    ./git
    #    ./neovim
    ./nixvim
    ./shell
  ];
}
