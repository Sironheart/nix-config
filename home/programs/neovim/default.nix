{ config
, pkgs
, flake
, ...
}: {
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
    ];
    extraConfig = ''
      set number relativenumber
    '';
  };
}
