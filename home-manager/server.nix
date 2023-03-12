{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marco";
  home.homeDirectory = "/Users/marco";

  imports = [
    (import ./zsh.nix {
      extraInitExtra = ''
        alias git=~/.nix-profile/bin/git
      '';
    })
  ];

}
