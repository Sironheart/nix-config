{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.docker-client
  ];

  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true; # Is disabled due to only being allowed of docker to configure dockerSocket
    defaultNetwork.settings.dns_enabled = true;
  };
}
