{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = ''
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
    shellAliases =
      let
        home = "${config.home.homeDirectory}";
      in
      {
        mirror = "wl-mirror eDP-1 & exit";
        helix = "hx";
        vim = "hx";
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
