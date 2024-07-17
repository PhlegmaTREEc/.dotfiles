{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-st.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-st";
    };
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = {self, nixpkgs, nixpkgs-st, home-manager, ...}@inputs:
  let
    lib = nixpkgs.lib;
    lib-st = nixpkgs-st.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (import ./overlays/multi.nix)
        #(import ./overlays/bcor.nix)
        ];
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "freeimage-unstable-2021-11-01" #unknown reason
        ];
      };
    };
    pkgs-st = import nixpkgs-st {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    #homeManagerModules = [
    #  nixvim.homeManagerModules.nixvim
    #];
  in {
    nixosConfigurations = {
      nixlxc = lib-st.nixosSystem {
        inherit system;
        specialArgs = {
          inherit pkgs-st;
          inherit pkgs;
        };
	      modules = [
          ../hosts/nixlxc/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs-st; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
      nixvm-test = lib-st.nixosSystem {
        inherit system;
        specialArgs = {
          inherit pkgs-st;
          inherit pkgs;
        };
	      modules = [
          ../hosts/nixvm/configuration.nix
          ({ config, pkgs, pkgs-st, ...}: {
            networking.hostName = "nixvm-test";
          })
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs-st pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
    };
  };
}
