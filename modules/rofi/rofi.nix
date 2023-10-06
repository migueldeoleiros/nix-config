{ config, pkgs, vars, ... }:

{
  home-manager.users.${vars.user} = {
    programs = {
      rofi.enable = true;
      rofi.theme = ./UltraDark.rasi;
    };
  };
}
