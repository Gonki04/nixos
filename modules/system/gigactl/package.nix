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

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram "$out/bin/gfan" \
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
