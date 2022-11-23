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
    };
    shellAliases = {
      mirror = "wl-mirror eDP-1 & exit";
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
