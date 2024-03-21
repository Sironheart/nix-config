{pkgs, ...}: {
  imports = [
    ../../../lib/shared/starship.nix
  ];

  home.sessionVariables = {
    AZURE_DEFAULT_DURATION_HOURS = "12";
    AZURE_DEFAULT_USERNAME = "beisenherz@netrtl.com";
    EDITOR = "nvim";
    LANG = "de_DE.UTF-8";
    LC_ALL = "de_DE.UTF-8";
    LC_CTYPE = "de_DE.UTF-8";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      lg = "lazygit";
    };

    loginShellInit = ''
      npm set prefix ~/.npm

      fish_add_path --prepend $HOME/.npm/bin
      fish_add_path --prepend /opt/homebrew/bin
      fish_add_path --prepend $HOME/.bin
      fish_add_path --prepend /etc/profiles/per-user/steffenbeisenherz/bin
    '';

    plugins = [
      {
        name = "autopair";
        inherit (pkgs.fishPlugins.autopair) src;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      dialect = "uk";
      keymap_mode = "vim-insert";
      show_preview = true;
      update_check = false;
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
  };

  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    mouse = false;
    shortcut = "s";

    shell = "${pkgs.fish}/bin/fish";

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Reloaded!"

      set-option -g status-position top

      bind c new-window -c "#{pane_current_path}"
      bind -N "Split the pane into two, left and right" v split-window -v -c "#{pane_current_path}"
      bind -N "Split the pane into two, top and bottom" s split-window -h -c "#{pane_current_path}"
    '';
  };

  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.ripgrep.enable = true;
}
