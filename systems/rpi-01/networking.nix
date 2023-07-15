{ config
, pkgs
, flake
, ...
}: {
  networking = {
    hostName = "rpi-nix-01";
    domain = "home";
  };
}