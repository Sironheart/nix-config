{pkgs, ...}: {
  documentation.enable = false;
  documentation.man.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.shells = [pkgs.fish];

  time.timeZone = "Europe/Berlin";
  system.defaults = {
    finder.ShowPathbar = true;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    dock = {
      mineffect = "scale";
      autohide = true;
      show-recents = false;
    };
    finder = {
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
      # ShowPathbar = true;
      ShowStatusBar = true;
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      AppleInterfaceStyle = "Dark";
      NSAutomaticCapitalizationEnabled = false;
      "com.apple.swipescrolldirection" = false;
      "com.apple.keyboard.fnState" = true;
      KeyRepeat = 2;
      AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleEnableSwipeNavigateWithScrolls = true;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDisableAutomaticTermination = true;
    };
  };
}
