{pkgs, config, lib, vars, ...}:

{
  home.packages = with pkgs; [
    acpi
  ];
  programs.eww = {
    enable = true; 
    package = pkgs.eww-wayland; 
    configDir = ./config; 
  };
}
