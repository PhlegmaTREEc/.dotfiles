{ config, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/virtualisation/proxmox-lxc.nix> ];


  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];

  services.openssh.enable = true;

  # Define users
  users = {
    users.ptclab = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
      initialPassword = "password";
      useDefaultShell = true;
    };
  };

  # Supress systemd units that don't work because of LXC.
  # https://blog.xirion.net/posts/nixos-proxmox-lxc/#configurationnix-tweak
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];

  time.timeZone = "Europe/Prague";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  system.stateVersion = "24.05";
}
