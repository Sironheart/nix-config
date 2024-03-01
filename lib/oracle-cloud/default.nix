{
  imports = [
    ./configuration
    ./packages
    ../shared
    ../shared/ssh-users.nix
  ];

  sops.defaultSopsFile = ./secrets/default.yaml;

  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  sops.age.generateKey = true;
}
