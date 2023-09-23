{ config
, pkgs
, lib
, ...
}:
{

  nixpkgs.config.allowUnfree = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids repl-flake
    '';

    settings.trusted-users = [ "root" "steffen" ];
  };

  system.stateVersion = "23.11";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
}
