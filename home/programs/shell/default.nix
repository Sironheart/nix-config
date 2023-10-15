{ config
, pkgs
, lib
, ...
}:
{
  imports = [
    ../../../systems/shared/macOS/shell/starship.nix
  ];

  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      ll = "ls -lsah";
      lg = "lazygit";
    };
    loginShellInit = ''
      export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
      export EDITOR=nvim

      set -x LC_ALL de_DE.UTF-8

      npm set prefix ~/.npm
      fish_add_path --prepend $HOME/.npm/bin
      fish_add_path --prepend /etc/profiles/per-user/steffenbeisenherz/bin
      fish_add_path $HOME/.bin
    '';
    plugins = with pkgs.fishPlugins; [
      {
        name = "sdkman-for-fish";
        src = pkgs.fishPlugins.sdkman-for-fish.src;
      }
    ];
  };

  programs.bat.enable = true;
}
