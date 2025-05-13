{pkgs, ...}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;
  font-size =
    if isLinux
    then "12"
    else "14";
in {
  imports = [
    ./direnv
    ./git
    ./linuxSettings
    ./shell
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = Geist Mono
    font-size = ${font-size}
    theme = flexoki-dark

    # macos-non-native-fullscreen = visible-menu
    macos-option-as-alt = true

    auto-update = check
    auto-update-channel = stable

    confirm-close-surface = false
    fullscreen = false
    working-directory = home

    copy-on-select = clipboard
    cursor-click-to-move = false
    quit-after-last-window-closed = true
    window-inherit-working-directory = true
    window-save-state = never

    #
    # custom keybinds
    #
    keybind = super+ctrl+k=resize_split:up,10
    keybind = super+ctrl+j=resize_split:down,10
    keybind = super+ctrl+h=resize_split:left,10
    keybind = super+ctrl+l=resize_split:right,10
    keybind = super+ctrl+up=ignore
    keybind = super+ctrl+down=ignore
    keybind = super+ctrl+left=ignore
    keybind = super+ctrl+right=ignore

    keybind = super+alt+k=goto_split:top
    keybind = super+alt+j=goto_split:bottom
    keybind = super+alt+h=goto_split:left
    keybind = super+alt+l=goto_split:right
    keybind = super+alt+up=ignore
    keybind = super+alt+down=ignore
    keybind = super+alt+left=ignore
    keybind = super+alt+right=ignore

    keybind = super+page_up=scroll_page_fractional:-0.5
    keybind = super+page_down=scroll_page_fractional:0.5
  '';

  home.file.".config/1Password/ssh/agent.toml".text = ''
    [[ssh-keys]]
    vault = "Personal"

    [[ssh-keys]]
    vault = "Work"
  '';

  home.file.".rgignore".text = "!.env*";
}
