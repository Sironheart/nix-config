{ pkgs
, lib
, config
, environment
, ...
}: {
  users.users = {
    steffen = {
      name = "steffen";
      home = "/Users/steffen";
    };
  };
}
