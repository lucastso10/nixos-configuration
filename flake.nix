{
  description = "Awesome nix config!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ... } @inputs: 
  let
    inherit (self) outputs;

    pkgs = import nixpkgs {
      config.allowUnfree = true;
      overlays = [];
    };

  in {
    nixosConfigurations = {
     punished = nixpkgs.lib.nixosSystem {
       specialArgs = {inherit inputs outputs; hostname = "punished"; };
       modules = [
         ./systems
         ./nixos/configuration.nix
       ];
     };
     solid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs; hostname = "solid"; };
        modules = [
          ./systems
          ./nixos/configuration.nix
        ];
      };
    };
  };
}
