{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    hyprpicker
    cliphist
    brightnessctl
    kitty # default terminal for hypr
    
    # screenshotting
    grim
    slurp
  ];

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  config.common.default = "*";
  };

  home.file.".config/hypr" = {
    target = ".config/hypr"; 
    source = ./config; 
    recursive = true;
    force = true;
  };

  # linking misc stuff
  home.file.".icons" = {
    target = ".icons";
    source = ./icons;
    recursive = true;
    force = true;
  };
}
