{
  description = "A very basic flake";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq/215026a";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wdisplays-src = {
      url = "github:artizirk/wdisplays";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, catppuccin, auto-cpufreq
    , wdisplays-src, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      flake-modules = [
        nixvim.homeManagerModules.nixvim
        catppuccin.homeManagerModules.catppuccin
      ];
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix auto-cpufreq.nixosModules.default ];
        };
      };

      homeConfigurations = {
        "enziokam@nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit wdisplays-src; };
          modules = flake-modules ++ [ ./home.nix ];
        };

        "enziokam@DESKTOP-SABAJRC" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = flake-modules ++ [ ./wsl.nix ];
        };
      };
    };
}
