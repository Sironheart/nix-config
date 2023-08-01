{ config, pkgs, ... }:

{
  # Desktop Apps
  environment.systemPackages = with pkgs; [
    _1password-gui
    brave
    discord
    jetbrains-toolbox
    vscode
  ];
}
