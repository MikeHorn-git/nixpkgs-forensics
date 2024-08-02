{ lib
, python3
, fetchFromGitHub
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "hindsight";
  version = "v2023.03";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "obsidianforensics";
    repo = "hindsight";
    rev = "d088bc543f9cf97b5ffa3cb14b103120f14139aa";
    hash = "sha256-WJokFSWZzRIz5jCDlc3EnePzmF0orXuvkyX4Pa73Mbg=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    bottle
    keyring
    protobuf
    puremagic
    pycryptodome
    pycryptodomex
    pytz
    setuptools
    xlsxwriter
  ];

  meta = with lib; {
    description = "Web browser forensics for Google Chrome/Chromium";
    homepage = "https://github.com/obsidianforensics/hindsight";
    license = licenses.apsl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "hindsight";
  };
}
