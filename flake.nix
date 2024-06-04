{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

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
    #pkgs-stable = import nixpkgs-stable {
    #  inherit system;
    #  config = {
    #    allowUnfree = true;
    #  };
    #};
    #homeManagerModules = [
    #  nixvim.homeManagerModules.nixvim
    #];
  in {
    nixosConfigurations = {
      nixmain = lib.nixosSystem {
        inherit system;
	      modules = [
          ./hosts/nixmain/configuration.nix
          ({ config, pkgs, ...}: {
          })
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
      #fvtt-vm = lib.nixosSystem {
      #  inherit system;
	    #  modules = [
      #    ./hosts/nixlab-fvtt-vm/configuration.nix
      #    ({ config, pkgs-stable, ...}: {
      #    })
      #    home-manager.nixosModules.home-manager {
      #      home-manager.extraSpecialArgs = { inherit inputs pkgs; };
      #    }
	    #  ];
      #};
      fvtt-lxc = lib.nixosSystem {
        inherit system;
	      modules = [
          ./hosts/nixlab-fvtt-lxc/configuration.nix
          #({ config, pkgs-stable, ...}: {
          #})
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
	      ];
      };
    };
  };
}
