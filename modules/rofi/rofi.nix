{ config, pkgs, vars, ... }:

{
  home-manager.users.${vars.user} = {
    programs = {
      rofi.enable = true;
      rofi.theme = ./EntropiaCenter.rasi;
    };
  };
}
