{ config
, pkgs
, nix-darwin
, ...
}: {
  homebrew = {
    enable = true;

    global = {
    };

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/core"
    ];

    casks = [
      "1password"
      "alfred"
      "brave-browser"
      "discord"
      "eqmac"
      "focusrite-control"
      "font-jetbrains-mono-nerd-font"
      "iterm2"
      "jetbrains-toolbox"
      "orbstack"
      "rocket"
      "spotify"
      "whatsapp"
      "yubico-yubikey-manager"
    ];

    masApps = {
      "Magnet" = 441258766;
      "Remote Desk Control" = 1509037746;
      "The Unarchiver" = 425424353;
    };
  };
}