{ stdenv, cmake, qpmad }:

stdenv.mkDerivation {
  name = "qpmad-test-dependency";

  inherit (qpmad) src;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qpmad ];

  prePatch = ''
    cd test/dependency/
  '';

  doCheck = true;
  checkPhase = ''
    echo "================= testing qpmad demo =================="
    pwd
    ls
    ./demo
  '';

  # dummy install
  installPhase = ''
    mkdir $out/
  '';
}
