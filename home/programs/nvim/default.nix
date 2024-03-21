{
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.system;
  mkHomeManager = inputs.sironheart-nvim.lib.mkHomeManager;
in {
  programs.neovim = mkHomeManager {inherit system;};
}
