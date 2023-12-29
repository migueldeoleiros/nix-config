{
  description = "NixOS and Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    kmonad.url = "github:kmonad/kmonad?dir=nix";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, kmonad, hyprland, ... }:
    let
      vars = {
        user = "miguel";
      };
    in {
      nixosConfigurations = (
        import ./nixos {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager kmonad hyprland vars;
        }
      );

      homeConfigurations = (
        import ./nix {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager kmonad hyprland vars;
        }
      );
    };
}
