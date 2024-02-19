{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/a311f018-8aac-40f1-b61d-b10f63da3427";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/86D9-0ACB";
      fsType = "vfat";
    };

  fileSystems."/games" = {
    device = "242cb01c-4c08-4a53-a3c9-5c281cd85e74";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."/vault" = {
    device = "82ac1a5e-121c-4256-a971-2f1ed93987d1";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/19adc39f-b2c2-4a5c-a533-600a26c76cbf"; }];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
