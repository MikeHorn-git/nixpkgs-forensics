{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, lib ? pkgs.lib
, fetchFromGitHub ? pkgs.fetchFromGitHub
, fetchpatch ? pkgs.fetchpatch
, fetchPypi ? pkgs.fetchPypi
, buildGoModule ? pkgs.buildGoModule
, python2 ? pkgs.python2
, python3 ? pkgs.python3
, stdenv ? pkgs.stdenv
}:

let
  analyzeMFT = import ./analyzeMFT/package.nix { inherit lib fetchFromGitHub python3; };
  bmc-tools = import ./bmc-tools/package.nix { inherit lib fetchFromGitHub python3; };
  docker-explorer = import ./docker-explorer/package.nix { inherit lib fetchFromGitHub python3; };
  hindsight = import ./hindsight/package.nix { inherit lib fetchFromGitHub python3; };
  Mac-Locations-Scraper = import ./Mac-Locations-Scraper/package.nix { inherit lib fetchFromGitHub python2; };
  PsqlHunter = import ./PsqlHunter/package.nix { inherit lib fetchFromGitHub python3; };
  recuperabit = import ./recuperabit/package.nix { inherit lib fetchFromGitHub python3; };
  regrippy = import ./regrippy/package.nix { inherit lib fetchFromGitHub python3; };
  timeliner = import ./timeliner/package.nix { inherit lib fetchFromGitHub buildGoModule; };
  usnparser = import ./usnparser/package.nix { inherit lib fetchPypi python3; };
  yarGen = import ./yarGen/package.nix { inherit lib fetchFromGitHub fetchpatch python3; };

  defaultPackage = stdenv.mkDerivation {
    name = "all-packages";
    dontUnpack = true;
    buildInputs = [
      analyzeMFT
      bmc-tools
      docker-explorer
      hindsight
      Mac-Locations-Scraper
      PsqlHunter
      recuperabit
      regrippy
      timeliner
      usnparser
      yarGen
    ];
  };

  packageToBuild = pkgName:
    let
      pkg = import ./${pkgName}/package.nix { inherit lib fetchFromGitHub fetchpatch fetchPypi buildGoModule python2 python3; };
    in
    stdenv.mkDerivation {
      name = pkgName;
      buildInputs = [ pkg ];
    };

in
{
  packages = {
    analyzeMFT = analyzeMFT;
    bmc-tools = bmc-tools;
    docker-explorer = docker-explorer;
    hindsight = hindsight;
    Mac-Locations-Scraper = Mac-Locations-Scraper;
    PsqlHunter = PsqlHunter;
    recuperabit = recuperabit;
    regrippy = regrippy;
    timeliner = timeliner;
    usnparser = usnparser;
    yarGen = yarGen;
  };

  defaultPackage = defaultPackage;
  packageToBuild = packageToBuild;
}
