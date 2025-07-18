{pkgs, ...}: {
  imports = [
    ../../../lib/shared/starship.nix
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    SHELL = "${pkgs.fish}/bin/fish";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      lg = "lazygit";
    };

    functions = {
      mkv_to_mp4 = {
        body = "ffmpeg -i $argv[1] -filter:v 'fps=59.99' -vsync cfr -c:a aac -strict experimental $argv[1].mp4";
      };
      fish_user_key_bindings = "fish_vi_key_bindings";
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

      #-------------------------------------------------------------------------------
      # Homebrew Shell Integration
      #-------------------------------------------------------------------------------
      if type -q brew
        if test -d (brew --prefix)"/share/fish/completions"
            set -p fish_complete_path (brew --prefix)/share/fish/completions
        end

        if test -d (brew --prefix)"/share/fish/vendor_completions.d"
            set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
        end
      end
    '';

    loginShellInit = ''
      npm set prefix ~/.npm

      fish_add_path --prepend /opt/homebrew/bin
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
