{ config
, pkgs
, flake
, ...
}:
{
  networking = {
    hostName = "rpi-nix-03";
    domain = "home";
  };
}
