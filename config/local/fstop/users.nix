{ ... }:

{
  users = {
    mutableUsers = true;
    users = {
      groot = {
        isNormalUser = true;
        uid = 1000;
        extraGroups = [ "wheel" "networkmanager" "audio" ];
        hashedPassword = "$6$GbJr2QzfSAuc46W7$f7qdWQ/IRF7KxBI876SKeoaJmUWiwTIsvxxKWRkykH9zLQLsKCk65ErWnchXU9Egp7ikJ6KI9KF263Mp/xhsl1";
      };
      fs = {
        isNormalUser = true;
        uid = 1001;
        password = "fs";
        extraGroups = [ "networkmanager" "audio" ];
      };
      root.hashedPassword = "$6$6P6PlR84pEMGb0fK$1g4AoI5V6TNLg9iiuHA7/VzahwUBnsUrWF3JSlev7uSBIFCbmYMmQyxOg7l.jnTZmDLuUl8l9Un7a8dIzJf5e.";
    };
  };
  security.sudo.wheelNeedsPassword = false;
}
