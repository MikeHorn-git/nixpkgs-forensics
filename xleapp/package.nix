{ lib
, python3
, fetchPypi
,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "xleapp";
  version = "0.2.1";
  doCheck = false;

  src = fetchPypi {
    inherit pname version;
    sha256 = "zCnpjiUNTSQHIa+nH1ThFFbsMKQ8URARc8z51EqKyDA=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    click
    jinja2
    pillow
    prettytable
    python-magic
    pysimplegui
    pyyaml
    simplekml
    wrapt
  ];

  meta = with lib; {
    description = "Framework for Logs, Events, And Plists Parser (LEAPP)";
    license = licenses.mit;
    platforms = platforms.all;
    homepage = "https://pypi.org/project/xleapp/";
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "xleapp";
  };
}
