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
      davinci-resolve
      docker
      ollama
      vscode
    ];

    networking.hostName = "punished";

    # Configure console keymap
    console.keyMap = "br-abnt2";

    desktop.hyprland.monitors = ''
      hl.monitor({ output = "DP-2", mode = "2560x1440@180", position = "0x0", scale = 1 })
      hl.monitor({ output = "DP-3", mode = "1920x1080@180", position = "2560x180", scale = 1 })
    '';

    desktop.hyprland.workspaces = ''
      local default = false
      local monitor = "DP-2"
      for i = 1, 10 do

        if i == 1 or i == 6 then
          default = true
        else
          default = false
        end

        if i >= 6 then
          monitor = "DP-3"
        end

        hl.workspace_rule({ workspace = i, monitor = monitor, default = default})
      end
    '';

    home-manager.backupCommand = "rm -f";

    networking.firewall.enable = true;
    nixpkgs.config.rocmSupport = true;
  };
}
