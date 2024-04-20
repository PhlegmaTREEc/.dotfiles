{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #ags.url = "github:Aylur/ags";
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
          #"electron-19.1.9" # added to allow install of etcher - version 1.18.13 should fix this 
          "freeimage-unstable-2021-11-01" #unknown reason
        ];
      };
    };
    #homeManagerModules = [
    #  nixvim.homeManagerModules.nixvim
    #];
  in {
    #homeConfigurations."ptc" = home-manager.lib.homeManagerConfiguration {
    #  inherit pkgs;
    #  extraSpecialArgs = { inherit inputs; };
    #  modules = [
    #    ./home/home.nix
    #  ];
    #  #++ homeManagerModules;
    #};
    nixosConfigurations = {
      nixmain = lib.nixosSystem {
        inherit system;
	      modules = [
          ./hosts/nixmain/configuration.nix
	        #./system/configuration.nix
	        #./system/greetd.nix
          ({ config, pkgs, ...}: {
          })
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit inputs pkgs; };
          }
	      ];
      };
    };
  };
}
