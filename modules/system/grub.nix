{config, pkgs, ...};

{
  boot.loader = {
  systemd-boot.enable = false;

  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot"; # Must match your EFI partition's mount point
  };

  grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true; # Detect Windows and add it to GRUB
  };

  timeout = 5;
};
}
