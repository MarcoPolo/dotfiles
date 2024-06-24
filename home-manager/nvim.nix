# see: man home-configuration.nix
{ pkgs, lib, config, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      seoul256-vim
      lightline-vim
      vim-surround
    ];
    extraConfig = ''
      let mapleader = ","
      colorscheme seoul256
      set number
    '';
  };
}
