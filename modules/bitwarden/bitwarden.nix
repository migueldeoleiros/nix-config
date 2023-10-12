{config, pkgs, inputs, vars, ...}:

{
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      bitwarden
      bitwarden-cli
      bitwarden-menu
    ];
  };
}
