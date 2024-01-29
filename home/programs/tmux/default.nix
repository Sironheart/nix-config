{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    # customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 20000;
    reverseSplit = true;
    terminal = "screen-256color";

    extraConfig = ''
      
    '' + builtins.readFile ../../../conf/tmux/theme.tmuxtheme;
  };
}
