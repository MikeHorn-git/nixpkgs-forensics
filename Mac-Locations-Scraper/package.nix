{ lib
, python2
, fetchFromGitHub
,
}:

python2.pkgs.buildPythonApplication rec {
  pname = "Mac-Locations-Scraper";
  version = "1.2";
  format = "other";

  src = fetchFromGitHub {
    owner = "mac4n6";
    repo = "Mac-Locations-Scraper";
    rev = "75ae3100a8361e1afec6f01efe50e04fa590b49a";
    hash = "sha256-QH3dxdhyaHsIUmWA4c7rglJDmeCDLfIWa7UH9yKy4BU=";
  };

  buildPhase = ''
    echo "Skipping build phase as there is no setup.py"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $src/mac_location_scraper.py $out/bin/mac_location_scraper
    chmod +x $out/bin/mac_location_scraper
  '';

  propagatedBuildInputs = with python2.pkgs; [
    simplekml
  ];

  meta = with lib; {
    description = "macOS/iOS database location scraper to extract location data";
    homepage = "https://github.com/mac4n6/Mac-Locations-Scraper";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "Mac-Locations-Scraper";
  };
}
