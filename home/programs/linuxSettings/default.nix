{pkgs, ...}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;
in {
  programs.firefox.enable = isLinux;

  home.packages =
    if isLinux
    then
      with pkgs; [
        alejandra
        zed-editor
      ]
    else [];
  home.file =
    if isLinux
    then {
      ".ssh/config".text = ''
        Host *
          SetEnv TERM=xterm-256color
          IdentityAgent ~/.1password/agent.sock
      '';
    }
    else {};
}
