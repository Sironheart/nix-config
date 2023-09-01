{ pkgs, ... }: {
  documentation.enable = false;
  documentation.man.enable = false;
  security.pam.enableSudoTouchIdAuth = true;

  environment.shells = [ pkgs.fish ];

  time.timeZone = "Europe/Berlin";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

  system.defaults.dock = {
    "mineffect" = "scale";
    "autohide" = true;
    "show-recents" = false;
  };
  system.defaults.finder = {
    "AppleShowAllFiles" = true;
    "AppleShowAllExtensions" = true;
    "FXPreferredViewStyle" = "Nlsv";
  };
  system.defaults.NSGlobalDomain = {
    "com.apple.swipescrolldirection" = false;
    "com.apple.keyboard.fnState" = true;
    "AppleEnableMouseSwipeNavigateWithScrolls" = false;
    "AppleEnableSwipeNavigateWithScrolls" = true;
    "NSAutomaticCapitalizationEnabled" = false;
    "NSAutomaticDashSubstitutionEnabled" = false;
    "NSAutomaticPeriodSubstitutionEnabled" = false;
    "NSAutomaticQuoteSubstitutionEnabled" = false;
    "NSAutomaticSpellingCorrectionEnabled" = false;
  };
}
