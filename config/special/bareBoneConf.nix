# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # GRUB 2
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  
  # networking
  networking = {
    usePredictableInterfaceNames = false;
    hostName = "cleanNixos";
  };

  # enable ttyS0 to be able to login through virsh
  systemd.services."serial-getty@ttyS0" = {
    wantedBy = [ "getty.target" ];
    serviceConfig.Restart = "always";
  };

  # time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git sudo
  ];

  # The chef user
  users.users.groot = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}

