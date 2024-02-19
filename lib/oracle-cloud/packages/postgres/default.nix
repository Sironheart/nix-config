{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    ensureUsers = [
      {
        name = "outline";
        ensurePermissions."DATABASE outline" = "ALL PRIVILEGES";
      }
    ];
    ensureDatabases = [ "outline" ];
  };
}
