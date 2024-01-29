{ pkgs
, inputs
, ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = [
      inputs.sironheart-nvim.packages.${pkgs.system}.default
    ];

    extraLuaConfig = ''
      require 'sironheart-nvim'
    '';
  };
}
