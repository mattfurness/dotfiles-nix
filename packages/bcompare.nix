{ lib
, fetchurl
, stdenv
, unzip
}:

let
  pname = "bcompare";
  version = "5.1.6.31527";

  throwSystem = throw "Unsupported system: ${stdenv.hostPlatform.system}";

  srcs = {
    x86_64-darwin = fetchurl {
      url = "https://www.scootersoftware.com/files/BCompareOSX-${version}.zip";
      sha256 = "sha256-d/4ipwj4WeO1druwFKmJXxMcdvy9OMszlcZz7wHmk3Y=";
    };

    aarch64-darwin = srcs.x86_64-darwin;
  };

  src = srcs.${stdenv.hostPlatform.system} or throwSystem;

  darwin = stdenv.mkDerivation {
    inherit pname version src meta;

    buildInputs = [ unzip ];

    unpackPhase = ''
      unzip $src
    '';

    installPhase = ''
      mkdir -p $out/Applications
      mv ./Beyond\ Compare.app $out/Applications/Beyond\ Compare.app
    '';

    dontFixup = true;

    dontStrip = true;
  };

  meta = with lib; {
    description = "GUI application that allows to quickly and easily compare files and folders";
    longDescription = ''
      Beyond Compare is focused. Beyond Compare allows you to quickly and easily compare your files and folders.
      By using simple, powerful commands you can focus on the differences you're interested in and ignore those you're not.
      You can then merge the changes, synchronize your files, and generate reports for your records.
    '';
    homepage = "https://www.scootersoftware.com";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    platforms = builtins.attrNames srcs;
  };
in
darwin
