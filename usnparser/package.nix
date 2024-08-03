{ lib
, python3
, fetchPypi
,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "usnparser";
  version = "4.1.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "hPDnr4+XXuD1U2bv73QyTi1QBxXi3cijhNZitAVwZGY=";
  };

  meta = with lib; {
    description = "A Python script to parse the NTFS USN Journal";
    homepage = "https://pypi.org/project/usnparser/";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "usnparser";
  };
}
