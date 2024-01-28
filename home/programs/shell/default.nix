{ pkgs
, ...
}:
{
  imports = [
    ../../../lib/shared/starship.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "de_DE.UTF-8";
    LC_ALL = "de_DE.UTF-8";
    LC_CTYPE = "de_DE.UTF-8";
  };


  programs.zsh = {
    enable = true;

    autocd = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;

    shellGlobalAliases = {
      cat = "bat";
      ll = "exa -al";
      lg = "lazygit";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [ "fzf" "gradle" "ripgrep" "sdk" "zsh-navigation-tools" "tmux" ];
    };

    initExtraFirst = ''
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        exec tmux
      fi
    '';

    initExtra = ''
      source $HOME/.sdkman/bin/sdkman-init.sh

      npm set prefix ~/.npm
      export PATH=$HOME/.npm/bin:/opt/homebrew/bin:/etc/profiles/per-user/steffenbeisenherz/bin:$HOME/.bin:$PATH
    '';
  };

  programs.z-lua = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "enhanced"
      "once"
      "fzf"
    ];
  };

  programs.fzf = {
    enable = true;
    tmux.enableShellIntegration = true;
  };
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.k9s.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;
  programs.eza.enable = true;
}
