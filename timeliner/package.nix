{ lib
, fetchFromGitHub
, buildGoModule
,
}:

buildGoModule rec {
  pname = "timeliner";
  version = "1.0";
  goVersion = "1.20";
  vendorHash = "sha256-L0EQy6AoaoJrcSDSTx4owhGmUtlMH60Okr5fL7rDhzQ=";

  src = fetchFromGitHub {
    owner = "airbus-cert";
    repo = "timeliner";
    rev = "b068f5f164eae9a729989697ff25656f86a67287";
    hash = "sha256-qWqwM/AIFMZ6giAEqEa9GhJFbUzARiudWVaN2fGrlJA=";
  };

  meta = with lib; {
    description = "A rewrite of mactime, a bodyfile reader";
    homepage = "https://github.com/airbus-cert/timeliner";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ MikeHorn-git ];
    mainProgram = "timeliner";
  };
}
