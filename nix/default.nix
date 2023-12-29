{ lib, inputs, nixpkgs, home-manager, kmonad, hyprland, vars, ... }:

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
  nitro = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit inputs kmonad vars; };
    modules = [
      ./configuration.nix
      {
        home = {
          username = "${vars.user}";
          homeDirectory = "/home/${vars.user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "23.05";
        };
      }
    ];
  };
}
