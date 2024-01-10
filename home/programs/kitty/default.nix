{ ...
}:
{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 100000;
      enable_audio_bell = false;
      update_check_interval = 0;
      copy_on_select = true;
      strip_trailing_spaces = "always";
      macos_quit_when_last_window_closed = "yes";
      macos_traditional_fullscreen = "yes";
    };
  };
}
