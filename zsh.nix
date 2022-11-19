{pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    loginExtra = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';
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
