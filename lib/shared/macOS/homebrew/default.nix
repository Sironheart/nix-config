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
      "pipx"
      "pulumi"
    ];

    casks = [
      "1password"
      "brave-browser"
      "discord"
      "elgato-camera-hub"
      "elgato-stream-deck"
      "ghostty"
      "jordanbaird-ice"
      "logi-options+"
      "notion"
      "obs"
      "obsidian"
      "raycast"
      "spotify"
      # "tailscale"
      "zed"
    ];
  };
}
