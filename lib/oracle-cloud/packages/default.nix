{pkgs, ...}: {
  imports = [
    ./caddy
    ./docker
  ];

  services.openssh.enable = true;

  environment.systemPackages = [
    pkgs.rclone
  ];
}
