{ pkgs, ... }:

let
  gpuUsage = pkgs.writeShellApplication {
    name = "waybar-gpu-usage";
    runtimeInputs = [ pkgs.coreutils ];
    text = ''
      gpu_device=
      for device in /sys/bus/pci/devices/*; do
        [ -r "$device/vendor" ] || continue
        vendor=$(cat "$device/vendor" 2>/dev/null || true)
        [ "$vendor" = "0x10de" ] || continue
        [ -r "$device/class" ] || continue
        device_class=$(cat "$device/class" 2>/dev/null || true)
        case "$device_class" in
          0x03*) gpu_device="$device"; break ;;
        esac
      done

      if [ -n "$gpu_device" ] && [ -r "$gpu_device/power/runtime_status" ]; then
        runtime_status=$(cat "$gpu_device/power/runtime_status" 2>/dev/null || true)
        if [ "$runtime_status" = "suspended" ]; then
          printf '%s\n' '—'
          exit 0
        fi
      fi

      nvidia_smi=/run/current-system/sw/bin/nvidia-smi
      if [ ! -x "$nvidia_smi" ]; then
        nvidia_smi=$(command -v nvidia-smi 2>/dev/null || true)
      fi
      if [ -z "$nvidia_smi" ]; then
        printf '%s\n' '—'
        exit 0
      fi

      usage=$("$nvidia_smi" --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null || true)
      case "$usage" in
        ''|*[!0-9]*) printf '%s\n' '—' ;;
        *) printf '%s%%\n' "$usage" ;;
      esac
    '';
  };
in
{
  home.packages = [ pkgs.waybar gpuUsage ];

  home.file.".config/waybar" = {
    target = ".config/waybar";
    source = ./config;
    recursive = true;
    force = true;
  };
}
