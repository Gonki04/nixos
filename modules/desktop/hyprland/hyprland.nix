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
      background = "#000000";
      foreground = "#FFFFFF";
      selection_background = "#FFFFFF";
      selection_foreground = "#000000";
      cursor = "#FFFFFF";
      cursor_text_color = "#000000";
      url_color = "#61A0FF";
      active_border_color = "#FFFFFF";
      inactive_border_color = "#404040";

      color0 = "#000000";
      color1 = "#FF5F5F";
      color2 = "#50FA7B";
      color3 = "#F1FA8C";
      color4 = "#61A0FF";
      color5 = "#D586FF";
      color6 = "#4DD0E1";
      color7 = "#D0D0D0";
      color8 = "#767676";
      color9 = "#FF7A7A";
      color10 = "#76FF9A";
      color11 = "#FFFFA5";
      color12 = "#8BB8FF";
      color13 = "#E0A4FF";
      color14 = "#79E6F3";
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
