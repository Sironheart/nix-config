{ config
, pkgs
, flake
, ...
}: {
  imports = [
    ./git
    ./homebrew
    ./neovim
    ./shell
  ];
}
