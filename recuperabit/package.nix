{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
  pname = "recuperabit";
  version = "1.1.6";
  format = "other";

  src = fetchFromGitHub {
    owner = "Lazza";
    repo = "RecuperaBit";
    rev = "c6f8678c628ffeb0b55ad54683e32c50283fac33";
    hash = "sha256-uNhT+AB9GCpTQm1Crfz03HSW8ZBIlhHtaMQahLLXiyI=";
  };

  buildPhase = ''
    echo "Skipping build phase as there is no setup.py"
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/lib/python${python3.pythonVersion}/site-packages
    cp -r $src/* $out/lib/python${python3.pythonVersion}/site-packages/
    ln -s $out/lib/python${python3.pythonVersion}/site-packages/main.py $out/bin/recuperabit
    chmod +x $out/bin/recuperabit
  '';

  meta = with lib; {
    description = "A tool for forensic file system reconstruction.";
    homepage = "https://github.com/Lazza/RecuperaBit";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "recuperabit";
  };
}
