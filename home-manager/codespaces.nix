{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "codespace";
  home.homeDirectory = "/home/codespace";

  # This is run in codespaces
  targets.genericLinux.enable = true;

  imports = [
    (import ./zsh.nix {
      extraInitExtra = ''
      '';
    })
  ];
}
