{ inputs, self, ... }:
{
  flake.nixosConfigurations.solid = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
      self.modules.nixos.solid
      {
        nixpkgs.hostPlatform = {
          system = "x86_64-linux";
        };
      }
    ];
  };

  flake.modules.nixos.solid = {
    home-manager.users.bolofofo = {
      imports = with self.modules.homeManager; [
        default
        hyprland
        bolofofo
      ];
    };

    imports = with self.modules.nixos; [
      default
      games
      hyprland
    ];

    networking.hostName = "solid";

    # Configure console keymap
    console.keyMap = "br-abnt2";

  };
}
