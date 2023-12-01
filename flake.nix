{
  description = "A very basic flake";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    codeoss-ext = {
      url = "github:nix-community/nix-vscode-extensions";
    };

    wdisplays-src = {
      url = "github:artizirk/wdisplays";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    codeoss-ext,
    wdisplays-src,
    ...
  }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      "enziokam@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit codeoss-ext wdisplays-src; };
        modules = [ ./home.nix ];
      };
    };
  };
}
