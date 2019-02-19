{ ... }:

{
  networking.hostName = "fstop";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  programs.ssh.startAgent = true;
  services.openssh.enable = true;
  services.openssh.extraConfig = "AllowUsers groot";
}
