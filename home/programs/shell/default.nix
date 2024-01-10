{ pkgs
, ...
}:
{
  imports = [
    ../../../lib/shared/macOS/shell
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "de_DE.UTF-8";
    LC_ALL = "de_DE.UTF-8";
    LC_CTYPE = "de_DE.UTF-8";
  };


  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;

    shellAliases = {
      cat = "bat";
      ll = "exa -al";
      lg = "lazygit";
    };

    initExtra = ''
      export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

      npm set prefix ~/.npm
      export PATH=$PATH:$HOME/.npm/bin:/opt/homebrew/bin:/etc/profiles/per-user/steffenbeisenherz/bin:$HOME/.bin
    '';

    syntaxHighlighting.enable = true;
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

  programs.ripgrep.enable = true;
  programs.k9s.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;
  programs.eza.enable = true;
  programs.fzf.enable = true;
}
