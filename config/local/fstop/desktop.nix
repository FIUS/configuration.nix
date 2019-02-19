{ lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "de,eu";
#    libinput.enable = true;
    synaptics.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  # Weird touchpad fix for this Fujitsu notebook (No joke)
  networking.hostId = lib.mkDefault "8425e349";
  boot.supportedFilesystems = [ "zfs" ];

  environment.systemPackages = with pkgs; let
    autostart-yakuake = pkgs.makeAutostartItem {
      name = "yakuake";
      package = yakuake;
      srcPrefix = "org.kde.";
    };
  in [
    yakuake
    autostart-yakuake
  ];
}
