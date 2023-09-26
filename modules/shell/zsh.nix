{ config, pkgs, vars, ... }:

{
  home-manager.users.${vars.user} = {
    programs.zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
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
    
    programs.starship = {
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
    
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
