{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "regippy";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "airbus-cert";
    repo = "regrippy";
    rev = "a7f11fb3d0d130559ad7d46200c73079c4ad2ecf";
    hash = "sha256-VlabTiJm70iPa9mrT2DHlHV3ld7nurKXthKDyqrY5so=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    pytest
    python-registry
    setuptools
  ];

  meta = with lib; {
    description = "A modern Python-3-based alternative to RegRipper";
    homepage = "https://github.com/airbus-cert/regrippy";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "regrippy";
  };
}
