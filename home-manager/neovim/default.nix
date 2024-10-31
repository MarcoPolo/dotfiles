# Inspired from https://github.com/Kidsan/nixos-config/tree/main/home/programs/neovim
# see: man home-configuration.nix
{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
    rust-analyzer-unwrapped
    black
  ];

  # Let legendary find sqlite
  home.sessionVariables = {
    LIBSQLITE = "${pkgs.sqlite.out}/lib/libsqlite3.dylib";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    coc.enable = false;
    withNodeJs = true;

    plugins = [
      # Handled by lazyvim
    ];
  };

  home.file."$HOME/.config/nvim2".source = "$HOME/dotfiles/home-manager/neovim/nvim";
}

