{ ...
}:
{
  virtualisation.oci-containers.containers = {
    teamcity-server = {
      autoStart = true;
      image = "jetbrains/teamcity-server:2023.05.4";
      environment = {
        TEAMCITY_HTTPS_PROXY_ENABLED = "true";
      };
      ports = [
        "8111:8111"
      ];
      volumes = [
        "/teamcity/data:/data/teamcity_server/datadir"
        "/teamcity/logs:/opt/teamcity/logs"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /teamcity 744 docker docker"
    "d /teamcity/data 744 docker docker"
    "d /teamcity/logs 744 docker docker"
  ];

  services.caddy = {
    virtualHosts."build.beisenherz.dev".extraConfig = ''
      encode gzip
      reverse_proxy http://127.0.0.1:8111
    '';
  };
}
