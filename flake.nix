{
  description = "My config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        };
    hyprland.url = "github:hyprwm/Hyprland";
    watershot.url = "github:Kirottu/watershot";
    };
  outputs = { self, nixpkgs, home-manager, hyprland, watershot, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true; };
      };

    lib = nixpkgs.lib;

  in {
    homeConfigurations."ptc" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home/home.nix
	      hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
        watershot.homeManagerModules.default
        ];
      };

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
	modules = [
	  ./system/configuration.nix
	  ./system/greetd.nix
	];
      };
    };
  };
}
