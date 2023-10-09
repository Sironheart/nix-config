{ config
, ...
}: {
  services.minio = {
    enable = true;
    rootCredentialsFile = config.sops.templates.minio_secret.path;
    listenAddress = "127.0.0.1:9000";
    consoleAddress = "127.0.0.1:9001";
  };

  services.caddy = {
    virtualHosts."storage.beisenherz.dev".extraConfig = ''
      encode gzip
      reverse_proxy http://127.0.0.1:9001
    '';
  };

  sops.secrets.minio_user = {};
  sops.secrets.minio_password = {};

  sops.templates.minio_secret = {
    mode = "0440";
    owner = "minio";
    content = ''
      MINIO_ROOT_USER = "${config.sops.placeholder.minio_user}";
      MINIO_ROOT_PASSWORD = "${config.sops.placeholder.minio_password}";
    '';
  };

#  environment.variables = {
#    MINIO_ROOT_USER = "${config.sops.secrets."minio/MINIO_ROOT_USER".content}";
#    MINIO_ROOT_PASSWORD = "${config.sops.secrets."minio/MINIO_ROOT_USER".content}";
#  };
}