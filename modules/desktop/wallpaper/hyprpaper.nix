{ pkgs, ... }:

{
  # Install swaybg instead of hyprpaper
  home.packages = with pkgs; [
    swaybg
  ];

  # Copy the image to a static, predictable location in your home folder
  home.file.".background.jpg".source = ./background.jpg;
}
