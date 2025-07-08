{stdenv, lib, fetchzip, wineWowPackages, makeWrapper}:

stdenv.mkDerivation rec {
  pname = "armcc";
  version = "4.0.771";
  src = fetchzip {
    url = "https://github.com/decompme/compilers/releases/download/compilers/armcc.zip";
    hash = "sha256-42DS6V6s0zs4wJCdpDUwwPtenmeVWxrqtVDQBv8bq8k=";
    stripRoot = false;
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/share/bin $out/share
    cp $src/${lib.versions.majorMinor version}/b${lib.versions.patch version}/bin/* $out/share/bin
    makeWrapper ${wineWowPackages.minimal}/bin/wine $out/bin/armar --add-flags "$out/share/bin/armar.exe"
    makeWrapper ${wineWowPackages.minimal}/bin/wine $out/bin/armasm --add-flags "$out/share/bin/armasm.exe"
    makeWrapper ${wineWowPackages.minimal}/bin/wine $out/bin/armcc --add-flags "$out/share/bin/armcc.exe"
    makeWrapper ${wineWowPackages.minimal}/bin/wine $out/bin/armlink --add-flags "$out/share/bin/armlink.exe"
    makeWrapper ${wineWowPackages.minimal}/bin/wine $out/bin/fromelf --add-flags "$out/share/bin/fromelf.exe"
  '';

  meta = {
    description = "ARM Embedded Compiler";
    homepage = "https://developer.arm.com/Tools%20and%20Software/Arm%20Compiler%20for%20Embedded";
    license = lib.licenses.unfree;
  };
}
