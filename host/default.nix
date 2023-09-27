{ lib, inputs, nixpkgs, home-manager, kmonad, vars, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    overlays = [
      inputs.kmonad.overlays.default
    ];
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  miguel = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit system pkgs inputs kmonad vars;
      host = {
        hostName = "nitro";
        mainMonitor = "HDMI-1";
        secondMonitor = "eDP-1";
      };
    };
    modules = [
      ./configuration.nix
      ./hardware-configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
      inputs.kmonad.nixosModules.default
    ];
  };
}
