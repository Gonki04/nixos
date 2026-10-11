{ config, pkgs, lib, inputs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    hyprpicker
    cliphist
    brightnessctl
    
    # screenshotting
    grim
    slurp
  ];

  programs.kitty = {
    enable = true;
    settings = {
      background = "#080808";
      foreground = "#EEEEEE";
      selection_background = "#333333";
      selection_foreground = "#FFFFFF";
      cursor = "#FFFFFF";
      cursor_text_color = "#080808";
      url_color = "#C0C0C0";
      active_border_color = "#FFFFFF";
      inactive_border_color = "#404040";

      color0 = "#080808";
      color1 = "#888888";
      color2 = "#A0A0A0";
      color3 = "#B8B8B8";
      color4 = "#707070";
      color5 = "#999999";
      color6 = "#C0C0C0";
      color7 = "#E0E0E0";
      color8 = "#505050";
      color9 = "#AAAAAA";
      color10 = "#B8B8B8";
      color11 = "#FFFFFF";
      color12 = "#909090";
      color13 = "#D0D0D0";
      color14 = "#E0E0E0";
      color15 = "#FFFFFF";
    };
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
