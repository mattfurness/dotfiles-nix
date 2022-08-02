{ fetchurl, stdenv, lib, unzip }:

stdenv.mkDerivation rec {
  pname = "bcompare";
  version = "4.4.3.26655";

  buildInputs = [ unzip ];

  src = fetchurl {
    url = "https://www.scootersoftware.com/BCompareOSX-${version}.zip";
    sha256 = "WApRf0UnMy2wTvDukfplLC+spC1kggdltyd2SKaliP4=";
  };

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out/Applications
    mv ./Beyond\ Compare.app $out/Applications/Beyond\ Compare.app
  '';

  dontBuild = true;
  dontConfigure = true;

  meta = with lib; {
    description = "GUI application that allows to quickly and easily compare files and folders";
    longDescription = ''
      Beyond Compare is focused. Beyond Compare allows you to quickly and easily compare your files and folders.
      By using simple, powerful commands you can focus on the differences you're interested in and ignore those you're not.
      You can then merge the changes, synchronize your files, and generate reports for your records.
    '';
    homepage = "https://www.scootersoftware.com";
    maintainers = [ ];
    platforms = platforms.darwin;
  };
}
