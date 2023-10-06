{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    kmonad.url = "github:kmonad/kmonad?dir=nix";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, kmonad, hyprland, ... }:
    let
      vars = {
        user = "miguel";
      };
    in {
      nixosConfigurations = (
        import ./host {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager kmonad hyprland vars;
        }
      );
    };
}
