{pkgs, ...}: let
  inherit (pkgs) stdenv;
  inherit (stdenv) isDarwin;
in {
  programs.lazygit = {
    enable = true;
    settings = {
      git.overrideGpg = true;
    };
  };

  programs.git = {
    enable = true;

    userEmail = "git@beisenherz.dev";
    userName = "Steffen Beisenherz";

    extraConfig = {
      commit.gpgsign = isDarwin;
      push.default = "current";
      fetch.prune = true;
      pull.rebase = true;
      rebase.autoStash = true;
      init.defaultBranch = "main";
      gpg.format = "ssh";
      push.autoSetupRemote = true;
      tag.gpgsign = true;
    };
  };

  programs.ssh.extraConfig = ''
    Host *
    	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    	ServerAliveInterval 3600
  '';
}
