{ pkgs
, ...
}:
{
  imports = [
    ./caddy
    ./docker
    ./outline
    ./minio
  ];

  services.openssh.enable = true;

  environment.systemPackages = [
    pkgs.rclone
  ];
}
