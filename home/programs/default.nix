{ config
, pkgs
, flake
, ...
}: {
  imports = [
    ./git
    ./neovim
    ./shell
  ];
}
