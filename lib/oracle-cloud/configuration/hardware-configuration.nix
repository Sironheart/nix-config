{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "virtio_pci" "virtio_scsi" "usbhid"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9be2d4c5-0e6e-44cb-bc75-b14abb74238e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/67AE-52DF";
    fsType = "vfat";
  };

  swapDevices = [];
  networking.useDHCP = true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
