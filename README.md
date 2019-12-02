# configuration.nix
The public nixos configurations in use by FIUS

## How to use
This repository is to be cloned on the devices which use it.
Then run the `applyConfig.sh` script. 
If the hostname does not match the name of the device in this repo, supply the name of the device.
Then confirm the application during the script execution.
Finally run `sudo nixos-rebuild switch`.

### Fstop
The repository is cloned into the home directory of groot and called config.
