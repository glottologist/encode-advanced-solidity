{
  pkgs ? import <nixpkgs> {},
  lib,
}:
pkgs.stdenv.mkDerivation {
  name = "sol2uml";
  src = pkgs.fetchFromGitHub {
    owner = "naddison36";
    repo = "sol2uml";
    rev = "cd68ac80119ccd003ea0b3e1985ce85e19d0e994";
    sha256 = "sha256-VB/1bnFCVwXTXkfKR1ZRvleDvpP7Wqz/R0sOrMIf5Bw=";
  };

  buildInputs = [pkgs.nodejs];

  buildPhase = ''
    npm install
    npm run build
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r ./* $out/
    ln -s $out/lib/cli.js $out/bin/sol2uml
  '';

  meta = {
    description = "Solidity to UML generator";
    homepage = "https://github.com/naddison36/sol2uml";
    license = pkgs.lib.licenses.mit;
  };
}
