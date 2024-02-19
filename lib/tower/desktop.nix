{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Budgie Desktop environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.budgie.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "steffen";
}
