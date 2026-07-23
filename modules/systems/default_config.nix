{ inputs, ... }:
{
  flake.modules.nixos.default =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      nixpkgs = {
        config.allowUnfree = true;
      };

      nix = {
        # This will add each flake input as a registry
        # To make nix3 commands consistent with your flake
        registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

        # This will additionally add your inputs to the system's legacy channels
        # Making legacy nix commands consistent as well, awesome!
        nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

        settings = {
          # Enable flakes and new 'nix' command
          experimental-features = "nix-command flakes";
          # Deduplicate and optimize nix store
          auto-optimise-store = true;
          # Keeps the git tree dirt warnings silent
          warn-dirty = false;

          max-jobs = 4;

          cores = 6;
        };
      };

      # Set your time zone.
      time.timeZone = "America/Sao_Paulo";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
      };

      console.colors = [
        "${config.lib.stylix.colors.base00}"
        "${config.lib.stylix.colors.base01}"
        "${config.lib.stylix.colors.base02}"
        "${config.lib.stylix.colors.base03}"
        "${config.lib.stylix.colors.base04}"
        "${config.lib.stylix.colors.base05}"
        "${config.lib.stylix.colors.base06}"
        "${config.lib.stylix.colors.base07}"
        "${config.lib.stylix.colors.base08}"
        "${config.lib.stylix.colors.base09}"
        "${config.lib.stylix.colors.base0A}"
        "${config.lib.stylix.colors.base0B}"
        "${config.lib.stylix.colors.base0C}"
        "${config.lib.stylix.colors.base0D}"
        "${config.lib.stylix.colors.base0E}"
        "${config.lib.stylix.colors.base0F}"
      ];

      users.users.bolofofo = {
        isNormalUser = true;
        description = "Main user";
        extraGroups = [
          "networkmanager"
          "wheel"
          "plugdev"
        ];
      };

      # Enable networking
      networking.networkmanager.enable = true;

      # Enable sound with pipewire.
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        #  alsa.enable = true;
        #  alsa.support32Bit = true;
        pulse.enable = true;
        #  jack.enable = true;
      };

      services.pipewire.extraConfig.pipewire."99-combine-stream" = {
        "context.modules" = [
          {
            name = "libpipewire-module-combine-stream";
            args = {
              "combine.mode" = "sink";
              "node.name" = "combine_sink";
              "node.description" = "My Combine Sink";
              "combine.latency-compensate" = false;
              "combine.props" = {
                "audio.position" = [
                  "FL"
                  "FR"
                ];
              };
              "stream.props" = { };
              "stream.rules" = [
                {
                  matches = [
                    {
                      # any of the items in matches needs to match, if one does,
                      # actions are emitted.
                      # all keys must match the value. ! negates. ~ starts regex.
                      #"node.name" = "~alsa_input.*";
                      "media.class" = "Audio/Sink";
                    }
                  ];
                  actions = {
                    "create-stream" = {
                      #"combine.audio.position" = [ "FL" "FR" ];
                      #"audio.position" = [ "FL" "FR" ];
                    };
                  };
                }
              ];
            };
          }
        ];
      };

      environment.systemPackages = with pkgs; [
        wget
        curl
      ];

      networking.firewall.enable = true;

      system.autoUpgrade = {
        enable = true;
        flake = "github:lucastso10/nixos-configuration";
      };

      # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
      system.stateVersion = "23.05";
    };
}
