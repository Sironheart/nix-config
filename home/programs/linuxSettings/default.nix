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
        _1password-gui
        _1password-cli
        brave
        vesktop

        sway
        chayang
      ]
    else [];
  services.swayidle = {
    enable = isLinux;
    systemdTarget = "wayland-session.target";
    events = [
      {
        event = "before-sleep";
        command = "swaylock-start";
      }
      {
        event = "lock";
        command = "swaylock-start";
      }
    ];
    timeouts = [
      {
        timeout = 185;
        command = "BACKGROUND=1 swaylock-start";
      }
      {
        timeout = 180;
        command = ''
          if ! pgrep swaylock; then brightnessctl --save && chayang -d 5; fi'';
        # resumeCommand =
        #   "if ! pgrep swaylock; then ${backlight-restore}/bin/backlight-restore; fi";
      }
      {
        timeout = 15;
        command = ''
          if pgrep swaylock; then brightnessctl --save; fi'';
      }
    ];
  };

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
