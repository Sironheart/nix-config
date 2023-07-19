{ config
, pkgs
, ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat";
      ll = "ls -lsah";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      container = {
        disabled = true;
      };
      username = {
        show_always = true;
      };
      kubernetes = {
        disabled = false;
      };
    };
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;
}
