{ config, pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  home.file.".config/waybar" = {
    target = ".config/waybar";
    source = ./config;
    recursive = true;
    force = true;
  };
}
