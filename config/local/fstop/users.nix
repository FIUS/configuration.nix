{ ... }:

{
  users = {
    mutableUsers = false;
    users = {
      groot = {
        isNormalUser = true;
        uid = 1000;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        hashedPassword = "$6$vdxj/WF153VDLHxJ$PGcMJN6KnNDaSz2TvFXwhIIyqZkoykmJXi5mFB7x1fxXnsVBEZnKVcni7uZFLS4fqCgPO.hs7MWhEmz.cG.js/";
      };
      fs = {
        isNormalUser = true;
        uid = 1001;
        password = "fs";
        extraGroups = [ "networkmanager" "audio" ];
      };
      root.hashedPassword = "$6$vdxj/WF153VDLHxJ$PGcMJN6KnNDaSz2TvFXwhIIyqZkoykmJXi5mFB7x1fxXnsVBEZnKVcni7uZFLS4fqCgPO.hs7MWhEmz.cG.js/";
    };
  };
  security.sudo.wheelNeedsPassword = false;
}
