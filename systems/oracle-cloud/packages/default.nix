{ ...
}:
{
  imports = [
    ./caddy
    ./docker
    ./outline
    ./minio
  ];

  services.openssh.enable = true;
}
