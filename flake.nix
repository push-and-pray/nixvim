{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs: let
    config = import ./config; # import the module directly
  in
    flake-utils.lib.eachDefaultSystem (system: let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs {inherit system;};
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in {
      formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      checks = {
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "My nixvim configuration";
        };
      };

      packages = {
        default = nvim;
      };
    });
}
