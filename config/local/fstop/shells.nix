{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;
  programs.zsh.enable = true;
  programs.fish.enable = true;

  # The idea here is: Users who want to configure their shell themselves probably use zsh
  # and know how to set the user shell. For the rest of the users we preconfigure fish.
  programs.fish.interactiveShellInit = with pkgs; ''
    # powerline-go
    function fish_prompt
      ${powerline-go}/bin/powerline-go -error $status -shell bare -modules venv,user,host,ssh,cwd,perms,git,hg,jobs,exit,root,nix-shell
    end

    # ctrl+backspace, ctrl+delete
    bind \b backward-kill-word
    bind \e\[3\;5~ kill-word
    echo "Welcome to NixOS."
    echo "To install any package you have three posibilities:"
    echo "If only need the program for a short duration use:"
    echo "nix-shell -p myProgram"
    echo "If you need the program permanently but only for the current user use:"
    echo "nix-env -iA nixos.myProgram"
    echo "If you want the program globally add it to the configuration on 
github.com/fius/configuration.nix, and follow the instrcutions there to deploy it."
  '';
  
  environment.interactiveShellInit = ''
    echo "Welcome to NixOS."
    echo "To install any package you have three posibilities:"
    echo "If only need the program for a short duration use:"
    echo "nix-shell -p myProgram"
    echo "If you need the program permanently but only for the current user use:"
    echo "nix-env -iA nixos.myProgram"
    echo "If you want the program globally add it to the configuration on 
github.com/fius/configuration.nix, and follow the instrcutions there to deploy it."
  '';
}
