{ pkgs
, lib
, config
, environment
, ...
}:
{
  users.users = {
    steffenbeisenherz = {
      name = "steffenbeisenherz";
      home = "/Users/steffenbeisenherz";
    };
  };
}
