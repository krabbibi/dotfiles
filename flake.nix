{
  description = "krabbiflakes";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #    sops-nix.url = "github:Mic92/sops-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-colors,
      nix-darwin,
      mac-app-util,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x84_64-linux";
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.krabbe = import ./nixos/home.nix;
              extraSpecialArgs = { inherit nix-colors; };
              backupFileExtension = "bac";
            };
          }
        ];
      };
      darwinConfigurations."krabbe-mbp" = nix-darwin.lib.darwinSystem {
        modules = [
          ./darwin/configuration.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.krabbe = import ./darwin/home.nix;
              extraSpecialArgs = { inherit nix-colors; };
              backupFileExtension = "bac";
            };

          }
        ];

      };
    };
}
