{ config
, flake
, pkgs
, ...
}:
{
  home.packages = with pkgs; [
    # devenv
    cachix
    flake.inputs.devenv.packages.${system}.devenv

    # general purpose
    fd
    gnumake
    gnupg
    htop
    jq
    kafkactl
    mkcert
    pinentry_mac
    ripgrep
    wget

    # kubernetes
    fluxcd
    k9s
    kubectl
    kubernetes-helm
    kustomize

    # languages
    nodejs
    nodePackages.pnpm
    ruby
    terraform
    rustc

    # language tooling
    cocoapods
    cargo
    rustfmt
    nixpkgs-fmt

    # language servers
    cuelsp
    haskell-language-server
    jsonnet-language-server
    lua-language-server
    nil
    nodePackages."bash-language-server"
    nodePackages."diagnostic-languageserver"
    nodePackages."dockerfile-language-server-nodejs"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
    rust-analyzer
    terraform-ls
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
