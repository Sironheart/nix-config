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

    extraConfig = ''
      lua << EOF
        require 'sironheart-nvim'
      EOF
    '';
  };
}
