{
  imports = [
    ./mac-config.nix
    ./nix-config.nix
    ./homebrew/default.nix
  ];

  system.stateVersion = 5;
}
