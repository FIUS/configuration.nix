{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = super: let self = super.pkgs; in {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
    myPython = (with pkgs; nur.repos.neumantm.pythonWithPipenv.override {
        myPythonDerivation = python37; 
        myPythonPackages = pp: with pp; [
          jedi
          mypy
          pylint
          rope
          #  nose
          black
          # pylama
          # flake8
          # autopep8
          pytest 
          pycodestyle
          pyaudio
        ];
    });
  };

  programs.mtr.enable = true;

  environment.systemPackages = with pkgs; [
    # Browsers
    chromium
    firefox
    # Development
    gitFull
    subversion
    # Media: Audio
    vlc
    ultrastardx
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
    # Other
    nur.repos.marzipankaiser.drinklist-cli
    # Systems tools
    ntfs3g
    file
    htop
    nmap
    tmux
    wget
    zip unzip
  ];
}
