{ config
, pkgs
, ...
}: {
  imports = [
    ../../home
  ];

  home = {
    username = "steffen";
    homeDirectory = "/home/steffen";

    stateVersion = "23.11";
  };
}
