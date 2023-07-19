{ 
  config, 
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    colima
    htop
    jq
    k9s
    k3sup
    kotlin
    kubectl
    kubernetes-helm
    nixpkgs-fmt
    temurin-bin
    terraform
    wget
  ];

  programs.home-manager.enable = true;
}
