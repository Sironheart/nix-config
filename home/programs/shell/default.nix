{ config
, pkgs
, lib
, ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      ll = "ls -lsah";
      lg = "lazygit";
      vi = "nvim";
    };
    loginShellInit = ''
      export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
      export EDITOR=nvim
      set fish_greeting

      ${lib.optionalString pkgs.stdenv.hostPlatform.isDarwin ''
      fish_add_path /run/current-system/sw/bin
      ''}

      fish_add_path $HOME/.npm-packages/bin/
    '';
    plugins = with pkgs.fishPlugins; [
      {
        name = "sdkman-for-fish";
        src = pkgs.fishPlugins.sdkman-for-fish.src;
      }
    ];
  };

  programs.starship = {
    enable = true;
    settings = {
      battery = {
        disabled = true;
      };
      container = {
        disabled = true;
      };
    };
  };

  programs.bat.enable = true;
}
