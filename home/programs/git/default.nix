{ config
, pkgs
, flake
, ...
}:
{
  programs.lazygit.enable = true;

  programs.git = {
    enable = true;

    delta.enable = true;

    userEmail = "git@beisenherz.dev";
    userName = "Steffen Beisenherz";

    extraConfig = {
      commit.gpgsign = true;
      push.default = "current";
      fetch.prune = true;
      pull.rebase = true;
      rebase.autoStash = true;
      init.defaultBranch = "main";
      gpg.format = "ssh";
      tag.gpgsign = true;
    };

    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      "._*"

      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"

      ".idea"
      ".vscode"
      ".fleet"
      "**/node_modules"
      "**/.gradle"
    ];
  };

  programs.ssh.extraConfig = ''
    Host *
    	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    	ServerAliveInterval 3600
  '';
}
