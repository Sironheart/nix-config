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

  home.file.".config/zed/keymap.json".text = ''
    // documentation: https://zed.dev/docs/key-bindings
    [
      {
        "context": "Workspace",
        "bindings": {
          "ctrl-~": null,
          "ctrl-`": null
          // "shift shift": "file_finder::Toggle"
        }
      },
      {
        "context": "Editor && inline_completion && !showing_completions",
        "use_key_equivalents": true,
        "bindings": {
          "ctrl-y": "editor::AcceptInlineCompletion",
          "ctrl-e": "editor::ToggleInlineCompletions",
          "tab": null
        }
      },
      {
        "context": "Editor && (showing_code_actions || showing_completions)",
        "bindings": {
          "ctrl-y": "editor::ConfirmCompletion"
        }
      },
      {
        "context": "Editor && showing_completions",
        "use_key_equivalents": true,
        "bindings": {
          "enter": null
        }
      }
    ]
  '';

  home.file.".config/zed/settings.json".text = ''
  {
    "theme": "JetBrains New Dark",
    "assistant": {
      "enabled": false,
      "version": "2"
    },
    "restore_on_startup": "none",
    "soft_wrap": "none",
    "autosave": "on_focus_change",
    "buffer_font_size": 14,
    "chat_panel": {
      "button": "always"
    },
    "collaboration_panel": {
      "button": false,
      "default_width": 0
    },
    "features": {
      "copilot": true,
      "edit_prediction_provider": "copilot"
    },
    "project_panel": {
      "default_width": 120
    },
    "relative_line_numbers": true,
    "tab_bar": {
      // "show": false,
      "show_nav_history_buttons": false,
      "show_tab_bar_buttons": false
    },
    "telemetry": {
      "diagnostics": false,
      "metrics": false
    },
    "toolbar": {
      "breadcrumbs": false,
      "quick_actions": false,
      "selections_menu": false
    },
    "scroll_beyond_last_line": "off",
    "ui_font_size": 14,
    "vim_mode": true,
    "terminal": {
      "button": false,
      "copy_on_select": true
    }
  }
  '';
}
