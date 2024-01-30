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


  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      ll = "exa -al";
      lg = "lazygit";
    };

    loginShellInit = ''
            if status is-interactive
            and not set -q TMUX
              if tmux has-session -t default
      	        exec tmux attach-session -t default
              else
                tmux new-session -s default
              end
            end

            npm set prefix ~/.npm

            fish_add_path --prepend $HOME/.npm/bin
            fish_add_path --prepend /opt/homebrew/bin
            fish_add_path --prepend $GOPATH
            fish_add_path --prepend $GOBIN
            fish_add_path --prepend $HOME/.bin
            fish_add_path --prepend /etc/profiles/per-user/steffenbeisenherz/bin
    '';

    plugins = [
      {
        name = "sdkman-for-fish";
        inherit (pkgs.fishPlugins.sdkman-for-fish) src;
      }
      {
        name = "autopair";
        inherit (pkgs.fishPlugins.autopair) src;
      }
    ];
  };

  programs.z-lua = {
    enable = true;
    enableFishIntegration = true;
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
