{config, ...}: {
  services.postgresqlBackup = {
    enable = true;
    backupAll = true;
    compression = "zstd";
  };

  systemd.tmpfiles.rules = [
    "z ${config.services.postgresqlBackup.location} 740 postgres root - -"
  ];

  services.restic.backups.postgres = {
    paths = [
      config.services.postgresqlBackup.location
    ];
    initialize = true;
    repository = "rclone:storagebox:oci/postgres";
    rcloneConfigFile = config.sops.secrets.rclone_config.path;
    passwordFile = config.sops.secrets.restic_password.path;
  };

  systemd.services."restic-backups-postgresql" = {
    requires = ["postgresqlBackup.service"];
    after = ["postgresqlBackup.service"];
  };

  sops.secrets.restic_password = {
    owner = "root";
  };
  sops.secrets.rclone_config = {
    owner = "root";
  };
}
