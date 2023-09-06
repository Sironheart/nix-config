{ config
, pkgs
, flake
, ...
}: {
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      editorconfig-vim
      nvim-tree-lua
      vim-markdown
      vim-nix

      nvim-lspconfig

      (nvim-treesitter.withPlugins (p: with p; [
        tree-sitter-comment
        tree-sitter-json
        tree-sitter-lua
        tree-sitter-nix
        tree-sitter-toml
        tree-sitter-yaml
      ]))
    ];
    extraConfig = ''
      luafile ${./config.lua}
    '';
  };
}
