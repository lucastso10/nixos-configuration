{
  description = "Awesome nix config!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim for configuring neovim with nix
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      directories = [
        home-manager.nixosModules.home-manager
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
          modules = directories;
        };
        solid = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            hostname = "solid";
          };
          modules = directories;
        };
        solidus = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            hostname = "solidus";
          };
          modules = directories;
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
