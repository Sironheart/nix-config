{
  lib,
  pkgs,
  ...
}: let
  system = pkgs.system;
  isLinux = system == "aarch64-linux" || system == "x86_64-linux";
in {
  imports =
    [
      ./alacritty
      ./direnv
      ./git
      ./nvim
      ./shell
      ./tmux
    ]
    # ++ lib.optional isLinux [./hyprland]
    ;

  home.file.".config/ghostty/config".text = ''
    background-opacity = 0.9
    confirm-close-surface = false
    # cursor-click-to-move = false
    font-family = JetbrainsMono Nerd Font
    fullscreen = false
    macos-non-native-fullscreen = visible-menu
    macos-option-as-alt = true
    mouse-hide-while-typing = true
    quit-after-last-window-closed = true
    window-save-state = never
    # working-directory = inherit
    # theme = flexoki-dark
    # window-inherit-working-directory = inherit
  '';
}
