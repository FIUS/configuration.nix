{ pkgs, ... }:

{
  programs.mtr.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Browsers
    chromium
    firefox
    # Development
    gitFull
    subversion
    # Media: Audio
    vlc
    # Media: Documents
    libreoffice
    pdfpc
    texlive.combined.scheme-full
    # Media: Images
    gimp
    gwenview
    spectacle
    # Media: Text
    dos2unix
    vim
    vscode
    # Security
    gnupg
    keepassxc
    # Social Media
    tdesktop
    # Systems tools
    file
    htop
    nmap
    tmux
    wget
    zip unzip
  ];
}