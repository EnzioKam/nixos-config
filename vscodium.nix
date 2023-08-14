{config, pkgs, codeoss-ext, ... }:

let
  ext = codeoss-ext.extensions.x86_64-linux;
  open-vsx = with ext.open-vsx; [
    catppuccin.catppuccin-vsc
    codezombiech.gitignore
    james-yu.latex-workshop
    jnoortheen.nix-ide
    julialang.language-julia
    llvm-vs-code-extensions.vscode-clangd
    medo64.render-crlf
    ms-python.python 
    pkief.material-icon-theme
    pkief.material-product-icons
    redhat.java
    tamasfe.even-better-toml
    yzhang.markdown-all-in-one
  ];
  ms-vsx = with ext.vscode-marketplace; [
    fabiospampinato.vscode-diff
    jduponchelle.rainbow-end
  ];

in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = open-vsx ++ ms-vsx;

    userSettings = {
      "code-eol.highlightNonDefault" = true;
      "editor.bracketPairColorization.enabled" = true;
      "editor.fontLigatures" = true;
      "editor.renderWhitespace" = "all";
      "editor.suggest.preview" = true;
      "editor.tabCompletion" = "on";
      "files.eol" = "\n";
      "files.exclude" = {
        "**/.classpath" = true;
        "**/.factorypath" = true;
        "**/.project" = true;
        "**/.settings" = true;
      };
      "java.jdt.ls.java.home" =  "${pkgs.jdk17}/lib/openjdk";
      "julia.execution.resultType" = "inline";
      "julia.symbolCacheDownload" = true;
      "julia.useCustomSysimage" = false;
      "latex-workshop.latex.autoBuild.run" = "never";
      "latex-workshop.view.pdf.viewer" = "tab";
      "redhat.telemetry.enabled" = false;
      "terminal.external.linuxExec" = "alacritty";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.productIconTheme" = "material-product-icons";
    };
  };

}
