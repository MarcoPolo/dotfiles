{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marco";
  home.homeDirectory = "/home/marco";

  imports = [
    (import ./zsh.nix {
      extraInitExtra = ''
        alias git=~/.nix-profile/bin/git
      '';
    })
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    coc.enable = false;
  };

  home.packages = with pkgs; [
      fontforge
      cmake
      lazygit
      zellij
      tree
      babashka
      watchexec
      graphviz
      kitty
      nixpkgs-fmt
      htop
      cacert
      gnupg
      git-crypt
      silver-searcher
      ripgrep
      gh
      wget
      mosh
      jq
      wasmtime
  ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = ["--disable-up-arrow"];
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  
}
