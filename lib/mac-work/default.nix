{
  imports = [
    ../shared/macOS
    ./users.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.settings.trusted-users = [ "root" "steffenbeisenherz" ];
}
