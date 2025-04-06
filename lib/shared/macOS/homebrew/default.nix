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
      "orbstack"
      "raycast"
      "spotify"
      "tailscale"
      "zed"
    ];
  };
}
