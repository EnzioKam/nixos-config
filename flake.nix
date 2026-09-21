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

    catppuccin.url = "github:catppuccin/nix";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    # Do not override its nixpkgs input, otherwise there can be mismatch between patches and kernel version
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      catppuccin,
      auto-cpufreq,
      nix-cachyos-kernel,
      ...
    }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      flake-modules = [ catppuccin.homeModules.catppuccin ];
    in
    {
      nixosConfigurations = {
        nixos-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./laptop/configuration.nix
            auto-cpufreq.nixosModules.default
          ];
        };
        nixos-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [
                  # Use the exact nixpkgs revision as defined in this repo to ensure binary cache hits.
                  nix-cachyos-kernel.overlays.pinned
                ];
              }
            )
            ./desktop/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "enziokam@nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = flake-modules ++ [ ./laptop/home.nix ];
        };

        "enziokam@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = flake-modules ++ [ ./desktop/home.nix ];
        };
      };
    };
}
