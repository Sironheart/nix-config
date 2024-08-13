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
      "alfred"
      "arc"
      "discord"
      "elgato-camera-hub"
      "focusrite-control"
      "google-chrome"
      "keymapp"
      "jetbrains-toolbox"
      "jordanbaird-ice"
      "notion"
      "orbstack"
      "postman"
      "spotify"
      "zed"
    ];

    masApps = {
      "Magnet" = 441258766;
      "Remote Desk Control" = 1509037746;
      "Whatsapp" = 310633997;
    };
  };
}
