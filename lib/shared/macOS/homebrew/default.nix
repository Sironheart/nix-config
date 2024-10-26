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
      "arc"
      "deskpad"
      "discord"
      "elgato-camera-hub"
      "focusrite-control"
      "jordanbaird-ice"
      "keymapp"
      "logi-options+"
      "orbstack"
      "raycast"
      "spotify"
      "zed"
    ];

    masApps = {
      "Remote Desk Control" = 1509037746;
      "Whatsapp" = 310633997;
    };
  };
}
