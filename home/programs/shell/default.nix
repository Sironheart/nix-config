{pkgs, ...}: let
  isDarwin = pkgs.system == "aarch64-darwin" || pkgs.system == "x86_64-darwin";
in {
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
    SHELL = "${pkgs.fish}/bin/fish";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      nb = "nix build --json --no-link --print-build-logs";
      lg = "lazygit";
    };

    loginShellInit = ''
      npm set prefix ~/.npm

      fish_add_path --prepend $HOME/.npm/bin
      fish_add_path --prepend /opt/homebrew/bin
      fish_add_path --prepend $HOME/.bin
      fish_add_path --prepend /etc/profiles/per-user/$USER/bin
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

  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.ripgrep.enable = true;

  programs.tmux = {
    enable = true;

    baseIndex = 1;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    reverseSplit = true;
    mouse = false;
    shortcut = "s";

    terminal =
      if isDarwin
      then "screen-256color"
      else "xterm-256color";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''
          is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
              | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
          bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
          bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
          bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
          bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
          tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
          if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
          if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

          bind-key -T copy-mode-vi 'C-h' select-pane -L
          bind-key -T copy-mode-vi 'C-j' select-pane -D
          bind-key -T copy-mode-vi 'C-k' select-pane -U
          bind-key -T copy-mode-vi 'C-l' select-pane -R
          bind-key -T copy-mode-vi 'C-\' select-pane -l
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'

          # config 2 on https://github.com/catppuccin/tmux
          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator "  █"

          set -g @catppuccin_window_default_fill "number"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#{b:pane_current_path}"

          set -g @catppuccin_status_modules_left "application"
          set -g @catppuccin_status_modules_right "session host"
          set -g @catppuccin_status_left_separator  ""
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_fill "all"
          set -g @catppuccin_status_connect_separator "yes"
        '';
      }
    ];

    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Reloaded!"

      set-option -g status-position top

      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
