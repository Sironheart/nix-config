{ pkgs
, inputs
, ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs; [
      # theme
      vimPlugins.catppuccin-nvim

      # languages
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-treesitter.withAllGrammars

      # telescope
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim
      vimPlugins.telescope-nvim

      #extras
      vimPlugins.nvim-treesitter-context
      vimPlugins.lualine-nvim
      vimPlugins.nvim-notify
      vimPlugins.nvim-colorizer-lua
      vimPlugins.which-key-nvim

      # configuration
      inputs.self.packages.${pkgs.system}.sironheart-nvim
    ];

    extraConfig = ''
      lua << EOF
        require 'sironheart-nvim'.init()
      EOF
    '';
  };
}
