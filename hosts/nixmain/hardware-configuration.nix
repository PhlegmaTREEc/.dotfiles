# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c7224214-6344-4dcd-9745-39109e1c8cfa";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/c7224214-6344-4dcd-9745-39109e1c8cfa";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/c7224214-6344-4dcd-9745-39109e1c8cfa";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/c7224214-6344-4dcd-9745-39109e1c8cfa";
      fsType = "btrfs";
      options = [ "subvol=log" ];
    };

  fileSystems."/etc" =
    { device = "/dev/disk/by-uuid/c7224214-6344-4dcd-9745-39109e1c8cfa";
      fsType = "btrfs";
      options = [ "subvol=etc" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/944F-2023";
      fsType = "vfat";
    };

  # Adding second ssd as data storage
  # Folder /mnt/ssdone has to be created
  # Ownership of the folder has to be changed
  # sudo chown -R ptc:users ssdone
  #fileSystems."/mnt/ssdone" =
  #  { device = "/dev/disk/by-uuid/58a54f27-dee8-4ae9-b5fa-0802708737c0";
  #    fsType = "ext4";
  #    options = ["defaults"];
  #  };

  # Entry to connect to mum's old drive for rescue
  #fileSystems."/mnt/testdrive" =
  #  { device = "/dev/disk/by-uuid/1C06-195B";
  #    fsType = "vfat";
  #    options = ["defaults"];
  #  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
