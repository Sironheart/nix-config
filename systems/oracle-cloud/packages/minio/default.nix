{ config
, ...
}: {
  services.minio = {
    enable = true;
    rootCredentialsFile = config.sops.secrets.minio.path;
    listenAddress = "127.0.0.1:9000";
    consoleAddress = "127.0.0.1:9001";
  };

  services.caddy = {
    virtualHosts."storage.beisenherz.dev".extraConfig = ''
      encode gzip
      reverse_proxy http://127.0.0.1:9001
    '';
  };

  config.sops.secrets.minio = {
    mode = "0440";
    user = "minio";
    format = "env";
  };
}
