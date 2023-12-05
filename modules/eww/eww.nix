{pkgs, config, lib, vars, ...}:

{
  home-manager.users.${vars.user} = {
    programs.eww = {
      enable = true; 
      package = pkgs.eww-wayland; 
      configDir = ./config; 
    };
  };
}
