{ config
, pkgs
, ...
}:
{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    options = {
      number = true;
      cursorline = true;
      title = true;
      updatetime = 0;
    };
    plugins = {
      cmp-nvim-lsp = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
      };
      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
      };
      lsp = {
        enable = true;
        servers = {
          pylsp.enable = true;
          nil_ls.enable = true;
          nil_ls.settings.formatting.command = [ "nixpkgs-fmt" ];
        };
      };
    };
    colorschemes.gruvbox.enable = true;
  };
}
