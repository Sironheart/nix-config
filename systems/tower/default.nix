{ config
, pkgs
, ...
}: {
  imports = [
    ./apps.nix
    ./desktop.nix
    ./hardware-configuration.nix
    ./system.nix
  ];

  # Auto upgrade nix package and the daemon service.
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixUnstable;

    settings.trusted-users = [ "root" "steffen" ];
  };

  programs.fish.enable = true;

  users.users.steffen.isNormalUser = true;
}
