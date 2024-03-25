{pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    loginExtra = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PF_INFO = "ascii title os host kernel uptime pkgs memory wm shell palette";
      FZF_DEFAULT_COMMAND = "fd -H";
      FZF_DEFAULT_OPTS=" \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8";
    };
    initExtra = ''
      function osc7-pwd() {
        emulate -L zsh # also sets localoptions for us
        setopt extendedglob
        local LC_ALL=C
        printf '\e]7;file://%s%s\e\' $HOST ''${PWD//(#m)([^@-Za-z&-;_~])/%''${(l:2::0:)$(([##16]#MATCH))}}
      }

      function chpwd-osc7-pwd() {
        (( ZSH_SUBSHELL )) || osc7-pwd
      }
      add-zsh-hook -Uz chpwd chpwd-osc7-pwd
    '';
    shellAliases = {
      mirror = "wl-mirror eDP-1 & exit";
      hmu = "home-manager switch --flake '/home/enziokam/.config/home-manager/#enziokam@nixos'";
    };
    prezto = {
      enable = true;
      caseSensitive = true;
      color = true;
      extraModules = [
        "attr"
        "stat"
      ];
      extraFunctions = [
        "zargs"
        "zmv"
      ];
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "syntax-highlighting"
        "autosuggestions"
      ];
      utility.safeOps = false;
      syntaxHighlighting = {
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "line"
          "root"
        ];
        pattern = {
          "rm*-rf*" = "fg=red,bold,underline";
        };
      };
    };
  };
}

