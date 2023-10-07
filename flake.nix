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
    inherit (nixpkgs) lib;    


    pkgs = import nixpkgs {
      config.allowUnfree = true;
      overlays = [];
    };

  in {
    nixosConfigurations = {
      punished = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/punished
          ./nixos/configuration.nix
        ];
      };
     solid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          #./nixos/configuration.nix
          #./nixos/nixos-laptop-hardware-configuration.nix
        ];
      };
    };
  };
}
