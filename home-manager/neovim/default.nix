# Inspired from https://github.com/Kidsan/nixos-config/tree/main/home/programs/neovim
# see: man home-configuration.nix
{ pkgs, lib, config, ... }:
let
  treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.bash
    p.comment
    p.css
    p.dockerfile
    p.fish
    p.gitattributes
    p.gitignore
    p.go
    p.gomod
    p.gowork
    p.hcl
    p.javascript
    p.jq
    p.json5
    p.json
    p.lua
    p.make
    p.markdown
    p.nix
    p.python
    p.rust
    p.toml
    p.typescript
    p.vue
    p.yaml
  ]));

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
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
      # treesitterWithGrammars
    ];
  };


  # home.file."./.config/nvim/init.lua" = {
  #   source = ./nvim/init.lua;
  # };
  # home.file."./.config/nvim/lua/marco" = {
  #   source = ./nvim/lua/marco;
  #   recursive = true;
  # };

  # home.file."./.config/nvim/lua/plugins" = {
  #   source = config.lib.file.mkOutOfStoreSymlink ./nvim/lua/plugins;
  # };

  # home.file."./.config/nvim/lua/marco/init.lua".text = ''
  #   vim.opt.runtimepath:append("${treesitter-parsers}")
  # '';

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  # home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
  #   recursive = true;
  #   source = treesitterWithGrammars;
  # };

}

