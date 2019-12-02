{ ... }:

{
  users = {
    mutableUsers = true;
    users = {
      groot = {
        isNormalUser = true;
        uid = 1000;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        hashedPassword = "$6$FeAbRdIK$b3t7Ecyvq7z9ZLa9pOq4ed94yiXB0inFq/WiJmQlVVPeOkEep5WjpVWBY//pNu6KLnOy.1vPA5Z5kpDApaC8G/";
      };
      fs = {
        isNormalUser = true;
        uid = 1001;
        password = "fs";
        extraGroups = [ "networkmanager" "audio" ];
      };
      root.hashedPassword = "$6$FeAbRdIK$b3t7Ecyvq7z9ZLa9pOq4ed94yiXB0inFq/WiJmQlVVPeOkEep5WjpVWBY//pNu6KLnOy.1vPA5Z5kpDApaC8G/";
    };
  };
  security.sudo.wheelNeedsPassword = false;
}
