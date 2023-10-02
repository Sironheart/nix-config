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
      indent-blankline = {
        enable = true;
      };

      gitsigns = {
        enable = true;
        currentLineBlame = true;
      };

      telescope = {
        enable = true;
      };

      treesitter = {
        enable = true;
        folding = false;
        indent = true;
        nixvimInjections = true;
        incrementalSelection.enable = true;
      };

      treesitter-context = {
        enable = true;
        maxLines = 2;
        minWindowHeight = 100;
      };

      comment-nvim = {
        enable = true;
      };

      which-key = {
        enable = true;
      };

      nvim-autopairs = {
        enable = true;
        checkTs = true;
        mapBs = true;
        mapCW = true;
      };

      lualine = {
        enable = true;
        componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        iconsEnabled = false;

        sections = {
          # Only show the first char of the current mode
          lualine_a = [
            {
              name = "mode";
              extraConfig.fmt.__raw = "function(str) return str:sub(1,1) end";
            }
            "selectioncount"
          ];
          lualine_b = [ "branch" "diff" ];
          lualine_c = [
            {
              name = "filename";
              extraConfig.path = 1;
            }
          ];

          lualine_x = [ "diagnostics" "filetype" ];
          lualine_y = [ "progress" "searchcount" ];
          lualine_z = [ "location" ];
        };

        tabline = {
          lualine_a = [
            {
              name = "windows";
              extraConfig.windows_color = {
                active = "lualine_a_normal";
                inactive = "lualine_b_inactive";
              };
            }
          ];
          lualine_z = [
            {
              name = "tabs";
              extraConfig.tabs_color = {
                active = "lualine_a_normal";
                inactive = "lualine_b_inactive";
              };
            }
          ];
        };
      };

      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
      };

      lspkind = {
        enable = true;
      };

      lsp = {
        enable = true;
        servers = {
          java-language-server = {
            enable = true;
          };
          kotlin-language-server = {
            enable = true;
          };
          nixd = {
            enable = true;
          };
          rust-analyzer = {
            enable = true;
          };
          terraformls = {
            enable = true;
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
#      sensible # Sensible defaults
      repeat # Repeatable plugin actions
      easy-align # Align text around symbols
#      direnv-vim # Direnv integration
    ];

    colorschemes.onedark.enable = true;
  };
}
