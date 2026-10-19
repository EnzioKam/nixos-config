{ winapps, ... }:

let
  system = "x86_64-linux";
in

{
  environment.systemPackages = [
    winapps.packages."${system}".winapps
    winapps.packages."${system}".winapps-launcher # optional
  ];

  # set up binary cache (optional)
  nix.settings = {
    substituters = [ "https://winapps.cachix.org/" ];
    trusted-public-keys = [ "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g=" ];
    trusted-users = [ "enziokam" ]; # replace with your username
  };
}
