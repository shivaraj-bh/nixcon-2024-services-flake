# Use upstream after https://github.com/NixOS/nixpkgs/pull/350458
{ pkgs, ... }:
{
  packages.presenterm-export = pkgs.python3Packages.buildPythonPackage rec {
    pname = "presenterm-export";
    version = "0.2.5";
    pyproject = true;

    src = pkgs.python3Packages.fetchPypi {
      pname = "presenterm_export";
      inherit version;
      hash = "sha256-jof/0phASV/0bE0wNaio9PVCfIgm30EWzlLWxPMw8Rs=";
    };

    pythonRelaxDeps = true;

    disabled = pkgs.python3Packages.pythonOlder "3.9";

    build-system = with pkgs.python3Packages; [
      setuptools
    ];

    dependencies = with pkgs.python3Packages; [
      ansi2html
      libtmux
      weasyprint
      dataclass-wizard
    ];

    pythonImportsCheck = [ "presenterm_export" ];
  };

}
