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

  outputs = {self, nixpkgs, home-manager, ...}:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true; };
    };
    #homeManagerModules = [
    #  nixvim.homeManagerModules.nixvim
    #];
  in {
    homeConfigurations."ptc" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/home.nix
      ];
      #++ homeManagerModules;
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
	      modules = [
	        ./system/configuration.nix
	        ./system/greetd.nix
          ({ config, pkgs, ...}: {
          })
	      ];
      };
    };
  };
}
