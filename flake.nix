{
  description = "My NixOS flake";

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
  let
    # ---- CUSTOM SETTINGS ---- #
    customSettings = {
      hostname = "nixos";
      username = "nu11z";
      timezone = "Europe/Moscow";
      locale = "en_US.UTF-8";
      extraLocale = "ru_RU.UTF-8";
      system = "x86_64-linux";
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
        ];
        specialArgs = { inherit pkgs-stable customSettings home-manager; };
      };
      void = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./profile/void/configuration.nix
        ];
        specialArgs = { inherit pkgs-stable customSettings home-manager; };
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
