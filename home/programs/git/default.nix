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
  };

  programs.ssh.extraConfig = ''
    Host *
    	IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    	ServerAliveInterval 3600
  '';
}
