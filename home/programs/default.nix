{ config
, pkgs
, flake
, ...
}:
{
  imports = [
    ./git
    ./golang
    ./kitty # This does currently not work, because alfred won't follow symlinks in the ~/Applications Folder
    ./nvim
    ./shell
  ];
}
