{ config, pkgs-st, ... }:

{
  imports = [ <nixpkgs/nixos/modules/virtualisation/proxmox-lxc.nix> ];

  home-manager.users.ptclab = import ../../home/lab/home.nix;

  environment.systemPackages = with pkgs-st; [
    curl
    git
    vim
  ];

  services.openssh.enable = true;

  programs.zsh.enable = true;

  # Define users
  users = {
    users.ptclab = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
      initialPassword = "password";
      useDefaultShell = true;
    };
    defaultUserShell = pkgs-st.zsh;
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
  
  # docker
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  system.stateVersion = "24.11";
}
