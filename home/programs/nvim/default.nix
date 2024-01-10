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
      inputs.self.packages.${pkgs.system}.sironheart-nvim
    ];

    extraLuaConfig = ''
      require 'sironheart-nvim'
    '';
  };
}
