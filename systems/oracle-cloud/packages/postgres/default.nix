{ pkgs
, ...
}: {
  services.postgresql = {
    enable = true;
    ensureDatabases = [
      "outline"
    ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    ensureUsers = [
      {
        name = "outline";
        ensurePermissions = {
          "DATABASE outline" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
