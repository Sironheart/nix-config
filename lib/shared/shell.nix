{ config
, pkgs
, lib
, ...
}:
{
  imports = [
    ../shared/starship.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -lsah";
      lg = "lazygit";
    };
    loginShellInit = ''
      export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
      export EDITOR=nvim
      export LC_ALL="de_DE.UTF-8"
      export PATH="$PATH:$HOME/.npm/bin:/etc/profiles/per-user/steffenbeisenherz/bin:$HOME/.bin"
    '';
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
