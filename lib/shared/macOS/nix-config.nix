{
  pkgs,
  flake,
  ...
}: let
  nixpkgs = flake.inputs.nixpkgs;
in {
  nix = {
    package = pkgs.nixVersions.nix_2_22;

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
      auto-optimise-store = true;
      builders-use-substitutes = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
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

  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;
}
