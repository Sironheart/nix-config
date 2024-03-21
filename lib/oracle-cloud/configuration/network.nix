{...}: {
  networking.hostName = "oci-nixos";
  networking.nameservers = ["1.1.1.1" "9.9.9.9"];
  networking.firewall.enable = false;
}
