{ ... }:

{
  nixpkgs.config.firefox.enableWideVine = true;
  ## WideVine is currently broken with Chromium
  # nixpkgs.config.chromium.enableWideVine = true;
}
