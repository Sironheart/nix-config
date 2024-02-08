{ pkgs
, inputs
, ...
}:
let
  system = pkgs.system;
in
{
  programs.neovim = inputs.sironheart-nvim.lib.mkHomeManager { inherit system; };
}
