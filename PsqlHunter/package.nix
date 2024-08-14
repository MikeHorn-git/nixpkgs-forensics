{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "PsqlHunter";
  version = "1.0.0";
  format = "other";

  src = fetchFromGitHub {
    owner = "MikeHorn-git";
    repo = "PsqlHunter";
    rev = "2f435cae19a33da8964314abbc7fd4fb7fcd3c4d";
    hash = "sha256-gqIkoO4AQMxA/PmJ51gM/juTK0xMuWym0e/ce0Z2qvI=";
  };


  propagatedBuildInputs = with python3.pkgs; [
    appdirs
    lxml
    packaging
    pyshark
    tabulate
    termcolor
    tqdm
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/PsqlHunter.py $out/bin/PsqlHunter
    chmod +x $out/bin/PsqlHunter
  '';

  meta = with lib; {
    description = "Hunt sql commands in pcap.";
    homepage = "https://github.com/MikeHorn-git/PsqlHunter";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ "MikeHorn-git" ];
    mainProgram = "PsqlHunter";
  };
}
