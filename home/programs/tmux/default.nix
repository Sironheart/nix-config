{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    historyLimit = 20000;
    mouse = false;
    shell = "${pkgs.zsh}/bin/zsh";

  };
}
