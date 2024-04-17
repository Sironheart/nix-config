{
  hyprland,
  pkgs,
  ...
}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;
in {
  wayland.windowManager.hyprland = {
    enable = isLinux;
    package = hyprland.packages.${pkgs.system}.hyprland;

    settings = {
      "$mod" = "SUPER";
    };
  };
}
