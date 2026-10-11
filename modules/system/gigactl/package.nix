{ lib
, stdenvNoCC
, makeWrapper
, coreutils
, gawk
, util-linux
, systemd
, nbfc-linux
, src
}:

stdenvNoCC.mkDerivation {
  pname = "gigactl-cli";
  version = "unstable-2026-10-11";
  inherit src;

  nativeBuildInputs = [ makeWrapper ];
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 "$src/gfan" "$out/bin/gfan"
    install -Dm644 "$src/gigactl-cli-lib.sh" "$out/bin/gigactl-cli-lib.sh"

    # makeWrapper runs the script through a hidden .gfan-wrapped path, so its
    # $0 cannot be used for the sudo re-exec. Keep the public wrapper path in
    # GFAN_SELF so the root invocation retains the Nix-provided environment.
    substituteInPlace "$out/bin/gfan" \
      --replace-fail 'if [ "$(id -u)" -ne 0 ]; then exec sudo "$0" "$@"; fi' \
        'if [ "$(id -u)" -ne 0 ]; then exec sudo "''${GFAN_SELF:-$0}" "$@"; fi'

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram "$out/bin/gfan" \
      --set GFAN_SELF "$out/bin/gfan" \
      --set GFAN_EC_PROBE "${nbfc-linux}/bin/ec_probe" \
      --prefix PATH : "/run/wrappers/bin:${lib.makeBinPath [ coreutils gawk util-linux systemd ]}"
  '';

  meta = {
    description = "Fan control for Gigabyte G5/G6 laptops using the Clevo EC";
    homepage = "https://github.com/smairio/gigactl";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    mainProgram = "gfan";
  };
}
