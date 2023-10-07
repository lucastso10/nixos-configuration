{
  description = "Awesome nix config!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  };

  outputs = {self, nixpkgs, home-manager, ... } 
  @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      punished = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          ./nixos/configuration.nix
          ./systems { hostname = "punished"; }
          inputs.minegrub-theme.nixosModules.default
        ];
      };
     solid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        # > Our main nixos configuration file <
        modules = [
          ./nixos/configuration.nix
          ./nixos/nixos-laptop-hardware-configuration.nix
          inputs.minegrub-theme.nixosModules.default
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
  };
}
