{ 
  config, 
  pkgs, 
  flake, 
  ...
}: {
  imports = [
    ../shared/all-systems.nix
    ../shared/raspberry-pi.nix
    ../shared/ssh-users.nix
    ../shared/shell.nix
  ];
}