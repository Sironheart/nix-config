{...}: let
  username = "steffen";
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  nixpkgs.config.allowUnfree = true;
}
