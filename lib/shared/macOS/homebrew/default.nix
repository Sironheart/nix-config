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
    ];

    casks = [
      "1password"
      "alfred"
      "arc"
      "discord"
      "eqmac"
      "notion"
      "focusrite-control"
      "google-chrome"
      "jetbrains-toolbox"
      "meld-studio"
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
