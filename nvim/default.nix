{
  imports = [
    ./nixvim.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  programs.nixvim.enable = true;
}
