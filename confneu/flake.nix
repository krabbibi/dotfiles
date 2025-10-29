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
    inputs@ {
      nixpkgs,
      home-manager,
      nix-colors,
      nix-darwin,
      mac-app-util,
      ...
    }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
          system = "x84_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.krabbe = ./nixHome.nix;
                extraSpecialArgs = { inherit nix-colors; };
                };
              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
      };
      darwinConfigurations."krabbe-mbp" = nix-darwin.lib.darwinSystem {
        modules = [
          ./macOS.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.krabbe = import ./macHome.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];

      };
      };
}
