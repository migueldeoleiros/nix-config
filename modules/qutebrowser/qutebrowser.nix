{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    programs.qutebrowser = {
      enable = true;
    };
  };
}
