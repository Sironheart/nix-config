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
      "focusrite-control"
      "google-chrome"
      "jetbrains-toolbox"
      "jordanbaird-ice"
      "notion"
      "orbstack"
      "postman"
      "slack"
      "spotify"
      "xcodes"
      "zed"
    ];

    masApps = {
      "Magnet" = 441258766;
      "Remote Desk Control" = 1509037746;
      "Whatsapp" = 310633997;
    };
  };
}
