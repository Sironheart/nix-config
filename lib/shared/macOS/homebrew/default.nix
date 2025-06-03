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
      "elgato-stream-deck"
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "jordanbaird-ice"
      "logi-options+"
      "notion"
      "obs"
      "obsidian"
      "raycast"
      "spotify"
      "tailscale"
      "utm"
      "zed"
    ];
  };
}
