{ ...
}:
{
  virtualisation.oci-containers.containers = {
    teamcity-agent = {
      autoStart = true;
      image = "jetbrains/teamcity-agent:2023.05.4";
      environment = {
        SERVER_URL = "https://build.beisenherz.dev";
        AGENT_NAME = "oci-agent";
      };
      volumes = [
        "/teamcity/agent/conf:/data/teamcity_agent/conf"
      ];
    };
  };
  systemd.tmpfiles.rules = [
    "d /teamcity 744 steffen root"
    "d /teamcity/agent 744 steffen root"
    "d /teamcity/agent/conf 744 steffen root"
  ];
}
