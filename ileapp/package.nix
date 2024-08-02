{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "ileapp";
  version = "1.19.4";
  doCheck = false;
  format = "other";

  src = fetchFromGitHub {
    owner = "abrignoni";
    repo = "iLEAPP";
    rev = "87d7f3484ed58a4e69fd9d91bfdea1b1bfe45896";
    hash = "sha256-YDWVA+Iqhsz2DE6/0vdKMHNW+Sr8JNWSFDbGHh3FCJs=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/bin/
    echo "#! /usr/bin/env python3" > $out/bin/ileapp
    cat $out/bin/ileapp.py >> $out/bin/ileapp
    chmod +x $out/bin/ileapp
  '';

  propagatedBuildInputs = with python3.pkgs; [
    biplist
    beautifulsoup4
    liblzfse
    mmh3
    numpy
    packaging
    pandas
    pathlib2
    pgpy
    pillow
    pillow-heif
    pycryptodome
    pyinstaller
    pytz
    simplekml
  ];


  meta = with lib; {
    description = "iOS Logs, Events, And Plist Parser";
    homepage = "https://github.com/abrignoni/iLEAPP";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "ileapp";
  };
}
