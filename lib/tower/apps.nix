{ config, pkgs, ... }:

{
  # Desktop Apps
  environment.systemPackages = with pkgs; [
    brave
    discord
    spotify
    vscode

    htop
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # Enable the 1Password CLI, this also enables a SGUID wrapper so the CLI can authorize against the GUI app
  programs._1password = {
    enable = true;
  };

  # Enable the 1Passsword GUI with myself as an authorized user for polkit
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "steffen" ];
  };
}
