{ config
, pkgs
, flake
, ...
}: {
  networking = {
    hostName = "rpi-nix-02";
    domain = "home";
  };
}
