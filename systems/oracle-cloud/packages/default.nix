{ ...
}:
{
  imports = [
    ./caddy
    ./docker
    ./postgres
    ./outline
    ./minio
  ];

  services.openssh.enable = true;
}
