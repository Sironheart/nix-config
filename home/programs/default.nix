{ lib, pkgs, ... }:
let
  system = pkgs.system;
  isLinux = system == "aarch64-linux" || system == "x86_64-linux";
in
{
  imports = [
    ./alacritty
    ./direnv
    ./git
    ./nvim
    ./shell
  ] /* ++ lib.optional isLinux [ ./hyprland ] */;
}
