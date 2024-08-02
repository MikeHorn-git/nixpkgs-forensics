{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "docker-explorer";
  version = "2023.07.19";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "google";
    repo = "docker-explorer";
    rev = "4a2f5fe843e45ccc5aa13ef5230d3c9dae4a0e31";
    hash = "sha256-QTzvq6/1LscY5uYKm2Sq+2uDgM8U7t79wedq5MqRKEU=";
  };

  propagatedBuildInputs = with python3.pkgs; [ requests ];

  meta = with lib; {
    description = "A tool to help forensicate offline docker acquisitions";
    homepage = "https://github.com/google/docker-explorer";
    license = licenses.apsl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "docker-explorer";
  };
}
