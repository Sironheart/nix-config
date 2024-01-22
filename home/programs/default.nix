{ config
, pkgs
, flake
, ...
}:
{
  imports = [
    ./git
    ./golang
    ./nvim
    ./shell
    ./tmux
  ];
}
