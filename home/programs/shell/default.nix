{ pkgs, ... }:
{
  imports = [
    ../../../lib/shared/starship.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "de_DE.UTF-8";
    LC_ALL = "de_DE.UTF-8";
    LC_CTYPE = "de_DE.UTF-8";
    AZURE_DEFAULT_USERNAME = "beisenherz@netrtl.com";
    AZURE_DEFAULT_DURATION_HOURS = "12";
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

  programs.z-lua = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "enhanced"
      "once"
      "fzf"
    ];
  };

  programs.bat.enable = true;
  programs.htop.enable = true;
  programs.eza = {
    enable = true;
    enableAliases = true;
    git = true;
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.jq.enable = true;
  programs.k9s.enable = true;
  programs.ripgrep.enable = true;
}
