{ pkgs
, ...
}:
{
  security.sudo.wheelNeedsPassword = false;

  users.defaultUserShell = pkgs.fish;

  users.users = {
    root = {
      extraGroups = [
        "docker"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE0DLI6+CW18E2YvESB1TWp3GEKUrAkb8J9UHpaadQ1/"
      ];
    };
    steffen = {
      isNormalUser = true;
      home = "/home/steffen";
      extraGroups = [
        "wheel"
        "docker"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKd07ad4m8K5hWXAWyLsTwZEvWRCmTV0d/Xp2gcVOf2ncnbxFbvdcpFt/YG2NQ7Ky487te6fMzMDNKYR6mlzCkvEE+mMadpJlMRkcjE9YuS+z5n93yJD9mAcDEN4blhzEeUhK1YwyKRX1YMZZMDwvqQpfM/Jr1VyFdfcHT4tzEw61SvFaWBWTG2khSuBDTXZ4S/++QeJJ5Tui7v8fDSsqfhAHNYcHV1hxMHAnW4dipZodtOyG662vusSvP2VBr4kdRl0DyzGzlXIcH5/gUI8a9VKj3Ufzj+5+FquGmtukb4mMnXllWivzGsEa62fN0y3ciyak7eYuWwrJjTteV6vNv"
      ];
    };
  };
}
