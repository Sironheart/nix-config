{ config
, pkgs
, ...
}: {
  users.defaultUserShell = pkgs.fish;

  programs.fish = {
    enable = true;
    useBabelfish = true;
    vendor = {
      completions.enable = true;
      functions.enable = true;
    };
  };
}
