# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, hardware, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."luks-5161d718-7b7b-43c2-b3dc-8489097c66cd" = {
    device = "/dev/disk/by-uuid/5161d718-7b7b-43c2-b3dc-8489097c66cd";
    allowDiscards = true;
  };

  boot.initrd.luks.devices."luks-4d73a396-4e2c-4526-a1d3-55b36e6d4916" = {
    device = "/dev/disk/by-uuid/4d73a396-4e2c-4526-a1d3-55b36e6d4916";
    allowDiscards = true;
  };

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/3838f577-fc17-454e-a9f6-663c87053c7c";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/6CD9-32D7";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/mnt/WD-SSD" =
    {
      device = "/dev/disk/by-uuid/b3636231-e388-44d6-bb96-ea30edd4249c";
      fsType = "btrfs";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
