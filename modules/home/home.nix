{ config, pkgs, lib, vars, ... }:

{
  home = {
    username = "${vars.user}";
    homeDirectory = "/home/${vars.user}";

    stateVersion = "23.05";

    sessionVariables = {
      EDITOR = "nvim";
    };
    
    packages = with pkgs; [
      kitty
      neovim
      tldr
      tmux
      gh
      firefox
      thunderbird
      libreoffice
      emacs
      mpv
      telegram-desktop
      amberol
      evince
      gradience
      vesktop
      gnome.gnome-font-viewer
      gnome.nautilus
      gnome.gvfs
      gnome.eog
      gnome.pomodoro
      gnome.gnome-calculator
      qbittorrent
      pixelorama
      gimp
      inkscape
      anki
      (pkgs.callPackage ../../pkgs/st.nix {})
    ];
  };
}
