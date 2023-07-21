{
  description = "A very basic flake";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rofi-wl-src = {
      url = "https://github.com/lbonn/rofi.git";
      flake = false;
      type = "git";
      submodules = true;
    };

    auto-cpufreq-src = {
      url = "github:AdnanHodzic/auto-cpufreq/v1.9.8";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    rofi-wl-src,
    auto-cpufreq-src,
    ...
  }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    stable = import nixpkgs-stable { inherit system; };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit stable auto-cpufreq-src; };
        modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      "enziokam@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit stable rofi-wl-src; };
        modules = [ ./home.nix ];
      };
    };
  };
}
