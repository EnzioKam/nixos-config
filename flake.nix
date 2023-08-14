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

    codeoss-ext = {
      url = "github:nix-community/nix-vscode-extensions";
    };

    auto-cpufreq-src = {
      url = "github:AdnanHodzic/auto-cpufreq/v1.9.9";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    codeoss-ext,
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
        extraSpecialArgs = { inherit stable codeoss-ext; };
        modules = [ ./home.nix ];
      };
    };
  };
}
