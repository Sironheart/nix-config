{
  homebrew = {
    enable = true;

    global = {
      autoUpdate = true;
    };

    onActivation = {
      cleanup = "uninstall";
      # autoUpdate = true;
      # upgrade = true;
    };

    taps = [
      "homebrew/cask"
    ];

    brews = [
      "pinentry-mac"
    ];

    casks = [
      "1password"
      "autodesk-fusion"
      "brave-browser"
      "deskpad"
      "discord"
      "elgato-camera-hub"
      "focusrite-control"
      "ghostty"
      "jordanbaird-ice"
      "logi-options+"
      "notion"
      "obsidian"
      "raycast"
      "spotify"
      "tailscale"
      "zed"
    ];
  };
}
