{ inputs, self, ... }:
{
  flake.nixosConfigurations.punished = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
      self.modules.nixos.punished
      {
        nixpkgs.hostPlatform = {
          system = "x86_64-linux";
        };
      }
    ];
  };

  flake.modules.nixos.punished = {
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
      vr
      hyprland
      flatpak
    ];

    networking.hostName = "punished";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.hyprland.monitors = [
      "DP-2, 2560x1440@180, 0x0, 1"
      "DP-3, 1920x1080@180, 2560x180, 1"
    ];

    desktop.hyprland.workspaces = [
      "1 , monitor:DP-2, default:true"
      "2 , monitor:DP-2"
      "3 , monitor:DP-2"
      "4 , monitor:DP-2"
      "4 , monitor:DP-2"
      "5 , monitor:DP-2"
      "6 , monitor:DP-3, default:true"
      "7 , monitor:DP-3"
      "8 , monitor:DP-3"
      "9 , monitor:DP-3"
      "10, monitor:DP-3"
    ];

    networking.firewall.enable = true;
  };
}
