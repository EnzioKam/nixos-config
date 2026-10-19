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

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";
    # Do not override its nixpkgs input, otherwise there can be mismatch between patches and kernel version

    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      auto-cpufreq,
      nix-cachyos-kernel,
      winapps,
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
          specialArgs = {
            inherit winapps;
          };
          modules = [
            {
              nixpkgs.overlays = [
                nix-cachyos-kernel.overlays.pinned
              ];
            }
            ./desktop/winapps.nix
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

      packages.${system} = {
        desktop-system = self.nixosConfigurations.nixos-desktop.config.system.build.toplevel;
        laptop-system = self.nixosConfigurations.nixos-laptop.config.system.build.toplevel;
        desktop-home = self.homeConfigurations."enziokam@nixos-desktop".activationPackage;
        laptop-home = self.homeConfigurations."enziokam@nixos".activationPackage;
        cachyos-kernel = nix-cachyos-kernel.legacyPackages.${system}.linuxPackages-cachyos-latest.kernel;
      };
    };
}
