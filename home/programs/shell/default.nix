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
      vim = "nvim";
    };
    loginShellInit = ''
      export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
      export EDITOR=nvim
      set fish_greeting

      fish_add_path $HOME/.npm-packages/bin/
      fish_add_path $HOME/.bin
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
      cmd_duration = {
        min_time = 0;
        show_milliseconds = true;
      };
      container = {
        disabled = true;
      };
      directory = {
        truncation_length = 999;
        truncate_to_repo = false;
      };
      hostname = {
        ssh_only = false;
      };
      java = {
        disabled = true;
      };
      line_break = {
        disabled = true;
      };
      localip = {
        disabled = false;
      };
      status = {
        disabled = false;
      };
    };
  };

  programs.bat.enable = true;
}
