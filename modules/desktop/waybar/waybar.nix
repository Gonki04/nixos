{ config, pkgs, lib, inputs, ... }:

let
  gfan = pkgs.callPackage ../../system/gigactl/package.nix {
    src = inputs.gigactl-src;
  };

  fanModeMenu = pkgs.writeShellApplication {
    name = "g6x-fan-menu";
    runtimeInputs = [ pkgs.tofi pkgs.libnotify gfan ];
    text = ''
      choice=$(printf '%s\n' \
        'Automatic (firmware)' \
        'Moderate (50%)' \
        'High (75%)' \
        'Full speed (100%)' \
        | tofi --prompt-text 'Fan mode: ') || exit 0

      case "$choice" in
        'Automatic (firmware)') mode=auto ;;
        'Moderate (50%)') mode=50 ;;
        'High (75%)') mode=75 ;;
        'Full speed (100%)') mode=max ;;
        *) exit 0 ;;
      esac

      if output=$(gfan "$mode" 2>&1); then
        notify-send -a 'G6X Fan Control' 'Fan mode changed' "$choice"
      else
        notify-send -u critical -a 'G6X Fan Control' 'Fan mode change failed' "$output"
      fi
    '';
  };
in
{
  home.packages = with pkgs; [
    waybar
    fanModeMenu
  ];

  home.file.".config/waybar" = {
    target = ".config/waybar";
    source = ./config;
    recursive = true;
    force = true;
  };
}
