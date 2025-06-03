{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit system;
          module = import ./config;
          extraSpecialArgs = {
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          default = nvim;
        };
      };
    };
}
