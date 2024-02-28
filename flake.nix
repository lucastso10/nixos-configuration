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

    # hyprland desktop enviroment
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, hyprland, ... } @inputs: 
  let
    inherit (self) outputs;

    directories = [
      hyprland.nixosModules.default
      home-manager.nixosModules.home-manager
      ./systems
      ./apps
      ./desktop
    ];

  in {
    nixosConfigurations = {
     punished = nixpkgs.lib.nixosSystem {
       specialArgs = {inherit inputs outputs; hostname = "punished";};
       modules = directories;
     };
     solid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs; hostname = "solid";};
        modules = directories;
      };
    };
  };
}
