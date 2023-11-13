{ pkgs
, ...
}:
{
  imports = [
    ./caddy
    ./docker
    ./minio
    ./outline
    ./postgres
  ];

  services.openssh.enable = true;

  environment.systemPackages = [
    pkgs.rclone
  ];
}
