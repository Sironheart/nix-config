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
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/core"
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
      "zed"
    ];

    masApps = {
      "Remote Desk Control" = 1509037746;
      "Whatsapp" = 310633997;
      "Pure Paste" = 1611378436;
      "1Password for Safari" = 1569813296;
      "The Unarchiver" = 425424353;
    };
  };
}
