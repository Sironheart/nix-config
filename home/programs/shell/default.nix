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
    SHELL = "${pkgs.fish}/bin/fish";
    _ZO_EXCLUDE_DIRS = "$HOME;$HOME/.config;$HOME/.local";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      nb = "nix build --json --no-link --print-build-logs";
      lg = "lazygit";
    };

    functions = {
      fish_greeting = {
        body = "krabby random -i";
      };
    };

    shellInit = ''
      #-------------------------------------------------------------------------------
      # Ghostty Shell Integration
      #-------------------------------------------------------------------------------
      # Ghostty supports auto-injection but Nix-darwin hard overwrites XDG_DATA_DIRS
      # which make it so that we can't use the auto-injection. We have to source
      # manually.
      if set -q GHOSTTY_RESOURCES_DIR
          source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
      end
    '';

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
      history_filter = [
        "token"
      ];
      show_preview = true;
      update_check = false;
      style = "compact";
      inline_height = 20;
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    git = true;
  };
  programs.ripgrep.enable = true;

  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.k9s.enable = true;
}
