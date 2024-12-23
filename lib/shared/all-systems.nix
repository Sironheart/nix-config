{
  nixpkgs.config.allowUnfree = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids
    '';

    settings.trusted-users = ["root" "steffen"];
  };

  system.stateVersion = "24.11";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
}
