{ pkgs, ... }:

{
  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ]; # tree-sitter for all langs
  home.packages = with pkgs; [ 
    neovim
    tree-sitter # my nvim cfg needs this
    lua51Packages.lua
    lua51Packages.luarocks
    lua51Packages.fennel
  ];
}
