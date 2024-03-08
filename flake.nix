{
  description = "Flake for Encode Advanced Solidity Bootcamp";

  inputs = {
    nixpkgs.url = "github:glottologist/nixpkgs/master";
    fenix.url = "github:nix-community/fenix";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    jupyenv.url = "github:tweag/jupyenv";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  nixConfig = {
    extra-substituters = [
      "https://tweag-jupyter.cachix.org"
      "https://devenv.cachix.org"
    ];
    extra-trusted-public-keys = [
      "tweag-jupyter.cachix.org-1:UtNH4Zs6hVUFpFBTLaA4ejYavPo5EFFqgd7G7FxGW9g="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    fenix,
    jupyenv,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.devenv.flakeModule
      ];

      # systems = inputs.nixpkgs.lib.systems.flakeExposed;
      systems = ["x86_64-linux"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        foundry = pkgs.callPackage ./nix/foundry.nix {inherit system pkgs;};
        sol2uml = pkgs.callPackage ./nix/sol2uml.nix {inherit system pkgs;};
      in rec
      {
        devenv.shells.default = {
          name = "Encode Bootcamp Shell";
          env.GREET = "Welcome to the Encode bootcamp shell";
          packages = with pkgs; [
            git
            slither-analyzer
            solc
            python311Packages.numpy
            python311Packages.scipy
            python311Packages.sympy
            python311Packages.ecpy
            python311Packages.py-ecc
            python311Packages.web3
            nodePackages.ganache
            echidna
            ethabi
            foundry
          ];
          enterShell = ''
            git --version
            nix --version
            solc --version
          '';
          scripts.sol.exec = ''
            solc --abi -o output/ --overwrite --bin $1
          '';
          languages = {
            nix.enable = true;
            python.enable = true;
          };
          dotenv.enable = true;
          devcontainer.enable = true;
          difftastic.enable = true;
          pre-commit.hooks = {
            alejandra.enable = true;
            commitizen.enable = true;
            prettier.enable = true;
          };
        };
      };
    };
}
