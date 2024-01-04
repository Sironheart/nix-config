{ config
, flake
, pkgs
, ...
}:
{
  imports = [
    ../shared/macOS
    ./users.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes auto-allocate-uids repl-flake
      auto-allocate-uids = true
      builders-use-substitutes = true
      builders = @/etc/nix/machines
      log-lines = 100
      nix-path = nixpkgs=${flake.inputs.nixpkgs}
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    settings.trusted-users = [ "root" "steffenbeisenherz" ];
  };

  programs.fish.enable = true;
}
