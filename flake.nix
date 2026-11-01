{
  description = "Nixos conf (WSL branch)";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }@inputs:
  let
    mkNixosSystem = { system, hostname, username, extraModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/${hostname}/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs;
                hostName = hostname;
              };
              users.${username} = import ./hosts/${hostname}/home.nix;
            };
          }
        ] ++ extraModules;
      };

  in {
    nixosConfigurations = {
      nixos = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "nixos";
        username = "gonkixos";
        extraModules = [ nixos-wsl.nixosModules.default ];
      };
    };
  };
}
