{
  description = "Awesome nix config!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ... } @inputs: 
  let
    inherit (self) outputs;

    directories = [
      home-manager.nixosModules.home-manager
      ./systems
      ./apps
      ./desktop
    ];

  in {
    nixosConfigurations = {
     punished = nixpkgs.lib.nixosSystem {
       specialArgs = {inherit inputs outputs;};
       modules = directories;
     };
     solid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = directories;
      };
    };
  };
}
