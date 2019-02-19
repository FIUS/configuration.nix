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
  '';
}