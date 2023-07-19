{ 
  pkgs, 
  lib, 
  config, 
  ...
}: {
  users.users.steffen = {
    name = "steffen";
    home = "/Users/steffen";
  };
}