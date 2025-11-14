{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        # overlays = [
        #   (import ./overlays/multi.nix)
        # ];
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "freeimage-unstable-2021-11-01" # unknown reason
          ];
        };
      };
      pkgsst = import nixpkgs-stable {
        inherit system;
        # overlays = [
        #   (import ./overlays/multi.nix)
        # ];
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "freeimage-unstable-2021-11-01" # unknown reason
          ];
        };
      };
    in
    {
      nixosConfigurations = {
        nixmain = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgsst; };
          modules = [
            ./hosts/nixmain/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs pkgs pkgsst; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
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
            home-manager.nixosModules.home-manager
            {
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
            (
              { config, pkgs, ... }:
              {
                networking.hostName = "nixvm-traffic";
              }
            )
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs pkgs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
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
            (
              { config, pkgs, ... }:
              {
                networking.hostName = "nixvm-test";
              }
            )
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs pkgs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
        };
      };
    };
}
