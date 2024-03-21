{config, ...}: {
  imports = [
    ./backup.nix
  ];

  services.outline = {
    enable = true;
    publicUrl = "https://notes.beisenherz.dev";
    port = 3000;
    defaultLanguage = "de_DE";
    databaseUrl = "local";
    redisUrl = "local";
    enableUpdateCheck = true;

    storage = {
      uploadBucketUrl = "https://storage-api.beisenherz.dev";
      uploadBucketName = "outline-storage";
      secretKeyFile = config.sops.secrets.outline_s3_secret_key.path;
      accessKey = "h9tNvrxMxKVmIRq5haze";
      region = config.services.minio.region;
    };

    oidcAuthentication = {
      displayName = "Auth0";
      clientId = "N6HVuSQHdJeH2aimWLIecBWxSi3mrrnw";
      clientSecretFile = config.sops.secrets.outline_auth0_secret_id.path;
      userinfoUrl = "https://beisenherz.eu.auth0.com/userinfo";
      authUrl = "https://beisenherz.eu.auth0.com/authorize";
      tokenUrl = "https://beisenherz.eu.auth0.com/oauth/token";
    };
  };

  sops.secrets.outline_s3_secret_key = {
    owner = "outline";
  };

  sops.secrets.outline_auth0_secret_id = {
    owner = "outline";
  };

  services.caddy = {
    virtualHosts."notes.beisenherz.dev".extraConfig = ''
      encode gzip
      reverse_proxy http://127.0.0.1:3000
    '';
  };
}
