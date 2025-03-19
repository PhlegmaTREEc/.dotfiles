{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  #outputs = {self, nixpkgs, home-manager, nixvim, ...}@inputs:
  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (import ./overlays/multi.nix)
        ];
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "freeimage-unstable-2021-11-01" #unknown reason
        ];
      };
    };
    #homeManagerModules = [
    #  nixvim.homeManagerModules.nixvim
    #];
  in {
    nixosConfigurations = {
      nixmain = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
	      modules = [
          ./hosts/nixmain/configuration.nix
            #({ config, pkgs, ...}: {
            #})
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
              #home-manager.sharedModules = [
              #  nixvim.homeManagerModules.nixvim
              #];
          }
	      ];
      };
      nixlxc = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs;
        };
	      modules = [
          ./hosts/nixlxc/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
      nixvm-traffic = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs;
        };
	      modules = [
          ./hosts/nixvm/configuration.nix
          ({ config, pkgs, ...}: {
            networking.hostName = "nixvm-traffic";
          })
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
              #home-manager.sharedModules = [
              #  nixvim.homeManagerModules.nixvim
              #];
          }
	      ];
      };
      nixvm-test = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs pkgs;
        };
	      modules = [
          ./hosts/nixvm/configuration.nix
          ({ config, pkgs, ...}: {
            networking.hostName = "nixvm-test";
          })
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
              #home-manager.sharedModules = [
              #  nixvim.homeManagerModules.nixvim
              #];
          }
	      ];
      };
    };
  };
}
