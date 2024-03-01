{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      cmake.disabled = true;
      cmd_duration = {
        min_time = 100;
        show_milliseconds = true;
      };
      directory = {
        truncation_length = 999;
        truncate_to_repo = false;
      };
      docker_context.disabled = true;
      env_var.disabled = true;
      gradle.disabled = true;
      package.disabled = true;
      status.disabled = false;
    };
  };
}
