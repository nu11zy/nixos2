{
  description = "NixOS flake";

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
  let
    # ---- CUSTOM SETTINGS ---- #
    customSettings = {
      hostname = "hostname";
      username = "username";
      timezone = "Europe/Moscow";
      locale = "en_US.UTF-8";
      regionFormat = "ru_RU.UTF-8";
    };

    # configure pkgs
    pkgs = import nixpkgs {
      system = customSettings.system;
      config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
    };

    pkgs-stable = import nixpkgs-stable {
      system = customSettings.system;
      config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
    };

    # configure lib
    lib = nixpkgs.lib;

  in {
    nixosConfigurations = {
      vm = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profile/vm/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${customSettings.username} = import ./profile/vm/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs;
              inherit pkgs-stable;
              inherit customSettings;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-stable;
          inherit customSettings;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; # unstable branch
    nixpkgs-stable.url = "nixpkgs/nixos-23.11"; # stable branch

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
}