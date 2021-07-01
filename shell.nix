{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/db6e089456cdddcd7e2c1d8dac37a505c797e8fa.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.which
    pkgs.htop
    pkgs.cabal-install
    pkgs.ghc
  ];

  shellHook = ''
    echo "setup cabal dev environment"
  '';

  MY_ENVIRONMENT_VARIABLE = "can be anyhting";
}
