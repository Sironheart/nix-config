{
  imports = [
    ./direnv
    ./git
    ./linuxSettings
    ./shell
  ];

  home.file.".config/ghostty/config".text = ''
    font-family = Geist Mono
    font-size = 14
    theme = flexoki-dark

    # macos-non-native-fullscreen = visible-menu
    macos-option-as-alt = true

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

    keybind = super+alt+k=goto_split:top
    keybind = super+alt+j=goto_split:bottom
    keybind = super+alt+h=goto_split:left
    keybind = super+alt+l=goto_split:right
  '';
}
