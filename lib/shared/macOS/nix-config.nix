{
  pkgs,
  flake,
  ...
}: let
  nixpkgs = flake.inputs.nixpkgs;
in {
  nix = {
    package = pkgs.nixVersions.latest;

    gc = {
      automatic = true;
      interval = {
        Weekday = 6;
        Hour = 3;
        Minute = 31;
      };
      options = "--delete-older-than 7d";
    };

    settings = {
      builders-use-substitutes = true;
      download-buffer-size = 524288000;

      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      warn-dirty = false;
    };

    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids
      auto-allocate-uids = true
      log-lines = 100
      nix-path = nixpkgs=${nixpkgs}
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };

  nixpkgs.config.allowUnfree = true;
}
