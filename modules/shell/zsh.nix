{ config, pkgs, vars, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
       # Change PATH to make sure local packages have priority

       # Get the first two path variables
       FIRST_PATH_VAR=$(echo $PATH | cut -d ":" -f 1)
       SECOND_PATH_VAR=$(echo $PATH | cut -d ":" -f 2)

       # Remove the first two path variables from the PATH
       export PATH=$(echo $PATH | cut -d ":" -f 3-)

       # Append the first two path variables to the end of the PATH
       export PATH=$PATH:$FIRST_PATH_VAR:$SECOND_PATH_VAR

       # flutter config
       export PATH=/opt/flutter/bin:$PATH

        #vi mode
        bindkey -v
        export KEYTIMEOUT=1
        bindkey "^?" backward-delete-char
        # Change cursor shape for different vi modes.
        function zle-keymap-select {
          if [[ ''${KEYMAP} == vicmd ]] ||
             [[ $1 = 'block' ]]; then
             echo -ne '\e[1 q'
          elif [[ ''${KEYMAP} == main ]] ||
               [[ ''${KEYMAP} == viins ]] ||
               [[ ''${KEYMAP} = ' ' ]] ||
               [[ $1 = 'beam' ]]; then
               echo -ne '\e[5 q'
          fi
        }
        zle -N zle-keyma p-select
      '';
    };
    
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # Get editor completions based on the config schema
        "$schema" = "https://starship.rs/config-schema.json";
        
        # Inserts a blank line between shell prompts
        add_newline = true;
        
        character = {
          success_symbol = "[❯](bold green)";
        };
      };
    };
    
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home = {
    packages = with pkgs; [
      eza
      trash-cli
    ];
  };
}
