{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 20000;
    keyMode = "vi";
    # reverseSplit = true;
    terminal = "screen-256color";

    extraConfig = ''
      bind c new-window -c "#{pane_current_path}"
      bind -N "Split the pane into two, left and right" v split-window -v -c "#{pane_current_path}"
      bind -N "Split the pane into two, top and bottom" s split-window -h -c "#{pane_current_path}"
    '' + builtins.readFile ../../../conf/tmux/theme.tmuxtheme;
  };
}
