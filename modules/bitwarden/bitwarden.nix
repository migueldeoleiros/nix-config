{config, pkgs, inputs, vars, ...}:

{
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    bitwarden-menu
  ];
}
