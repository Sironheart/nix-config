{ config
, pkgs
, nix-darwin
, ...
}:
{
  homebrew = {
    enable = true;

    global = { };

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/core"
    ];

    brews = [
      "awscli"
      "aws-iam-authenticator"
      "pinentry-mac"
    ];

    casks = [
      "1password"
      "alfred"
      "brave-browser"
      "discord"
      "eqmac"
      "firefox"
      "focusrite-control"
      "font-jetbrains-mono-nerd-font"
      "google-chrome"
      "iterm2"
      "jetbrains-toolbox"
      "orbstack"
      "postman"
      "rocket"
      "slack"
      "spotify"
      "yubico-yubikey-manager"
    ];

    masApps = {
      "Magnet" = 441258766;
      "Remote Desk Control" = 1509037746;
      "The Unarchiver" = 425424353;
      "Whatsapp" = 310633997;
    };
  };
}
