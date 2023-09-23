{ ...
}:
{
  imports = [
    ./caddy
    ./docker
  ];

  services.openssh.enable = true;
}
