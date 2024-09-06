{pkgs, ...}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isLinux;
in {
  programs.firefox.enable = isLinux;

  home.packages =
    if isLinux
    then
      with pkgs; [
        _1password-gui
        _1password
        brave
        discord

        sway
      ]
    else [];

  home.file =
    if isLinux
    then {
      ".ssh/config".text = ''
        Host *
          IdentityAgent ~/.1password/agent.sock
      '';
    }
    else {};
}
