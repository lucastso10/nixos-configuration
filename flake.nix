{
  description = "Awesome nix config!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    neovim.url = "github:lucastso10/Neovim";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      modules_paths = [
        home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        nur.modules.nixos.default
        ./systems
        ./apps
        ./desktop
      ];
    in
    {
      nixosConfigurations = {
        punished = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            hostname = "punished";
          };
          modules = modules_paths;
        };
        solid = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            hostname = "solid";
          };
          modules = modules_paths;
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

    };
}
