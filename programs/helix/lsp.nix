{ pkgs, ... }: {

  home.packages = with pkgs; [
    marksman
    mdformat
    nixd
    nixfmt
    ruff
    jdt-language-server
  ];
}
