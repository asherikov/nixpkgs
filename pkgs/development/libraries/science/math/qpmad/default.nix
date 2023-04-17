{ lib, stdenv
, fetchFromGitHub
, cmake
, eigen
, callPackage
}:

stdenv.mkDerivation rec {
  pname = "qpmad";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "asherikov";
    repo = "qpmad";
    rev = "${version}";
    sha256 = "1kERKWG/P7lIsGCqIeXj414xC2kBbLLp04jjlK9XfTU=";
  };

  buildInputs = [ eigen ];
  nativeBuildInputs = [ cmake ];

  passthru.tests = {
    dependency = callPackage ./tests.nix { };
  };

  meta = with lib; {
    description = "Eigen-based, header-only C++ implementation of Goldfarb-Idnani algorithm for quadratic programming";
    homepage = "https://www.sherikov.net/qpmad/";
    license = licenses.asl20;
    maintainers = [ ];
    platforms = platforms.all;
  };
}
