{ config, pkgs, lib, inputs, kmonad, vars, ... }:

{
  imports = (
    import ../modules/qutebrowser ++
    import ../modules/shell ++
    import ../modules/rofi ++
    import ../modules/gtk ++
    import ../modules/bitwarden ++
    import ../modules/yazi ++
    #import ../modules/hyprland ++
    import ../modules/i3 ++
    import ../modules/home
  );

  targets.genericLinux.enable = true;

  home = {
    activation = {
      linkDesktopApplications = { # Add Packages To System Menu
        after = [ "writeBoundary" "createXdgUserDirectories" ];
        before = [ ];
        data = "/usr/bin/sudo /usr/bin/update-desktop-database";
      };
    };
  };

  # Add Nix Packages to XDG_DATA_DIRS
  xdg = {
    enable = true;
    systemDirs.data = [ "/home/${vars.user}/.nix-profile/share" ];
  };

  # Nix Package Manager Settings
  nix = {
    settings ={
      auto-optimise-store = true;
    };

    # Enable Flakes
    package = pkgs.nixFlakes;                           
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  # Allow Proprietary Software.
  nixpkgs.config.allowUnfree = true;
}
