{
  imports = [
    ../shared/macOS
    ./users.nix
  ];

  nix.settings.trusted-users = ["root" "steffenbeisenherz"];

  programs.fish.enable = true;
}
