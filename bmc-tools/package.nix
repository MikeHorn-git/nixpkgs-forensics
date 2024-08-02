{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "bmc-tools";
  version = "3.0.2";

  src = fetchFromGitHub {
    owner = "ANSSI-FR";
    repo = "bmc-tools";
    rev = "c66a6575209fd6501fe99fc8689468d2400366c5";
    hash = "sha256-E0zvdQHUnpxwu4G5eEy+G02MoOQcQB3BYxb2ycHmQqI=";
  };

  buildPhase = ''
    echo "Skipping build phase as there is no setup.py"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $src/bmc-tools.py $out/bin/bmc-tools
    chmod +x $out/bin/bmc-tools
  '';

  format = "other";

  meta = with lib; {
    description = "RDP Bitmap Cache parser";
    homepage = "https://github.com/ANSSI-FR/bmc-tools";
    license = licenses.cecill21;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "bmc-tools";
  };
}
