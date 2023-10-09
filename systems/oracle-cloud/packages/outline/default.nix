{ ...
}: {
  services.outline = {
    enable = true;
    defaultLanguage = "de_DE";
    databaseUrl = "postgresql://user@localhost/outline";
    storage = "local";
    enableUpdateCheck = true;
#    publicUrl = "notes.beisenherz.dev";
  };

  services.caddy = {
    virtualHosts."notes.beisenherz.dev".extraConfig = ''
      encode gzip
      reverse_proxy http://127.0.0.1:3000
    '';
  };
}
