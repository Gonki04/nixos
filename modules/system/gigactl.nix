{ pkgs, inputs, ... }:

let
  gigactl = pkgs.callPackage ./gigactl/package.nix {
    src = inputs.gigactl-src;
  };

  allowedFanCommands = map (mode: {
    command = "${gigactl}/bin/gfan ${mode}";
    options = [ "NOPASSWD" ];
  }) [ "auto" "50" "75" "max" ];
in
{
  environment.systemPackages = [ gigactl ];

  # The upstream guard recognizes G6X9KG as a G6-series model but marks it
  # untested; it verifies each write and returns to firmware auto on mismatch.
  # gfan re-executes itself through sudo for EC access. Restrict passwordless
  # root access to the four fixed modes exposed in the Waybar menu.
  security.sudo.extraRules = [
    {
      users = [ "gonki" ];
      commands = allowedFanCommands;
    }
  ];
}
