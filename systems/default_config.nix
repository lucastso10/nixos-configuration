{ inputs, lib, config, pkgs, outputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      # Keeps the git tree dirt warnings silent
      warn-dirty = false;
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
    "${config.colorScheme.palette.base00}"
    "${config.colorScheme.palette.base01}"
    "${config.colorScheme.palette.base02}"
    "${config.colorScheme.palette.base03}"
    "${config.colorScheme.palette.base04}"
    "${config.colorScheme.palette.base05}"
    "${config.colorScheme.palette.base06}"
    "${config.colorScheme.palette.base07}"
    "${config.colorScheme.palette.base08}"
    "${config.colorScheme.palette.base09}"
    "${config.colorScheme.palette.base0A}"
    "${config.colorScheme.palette.base0B}"
    "${config.colorScheme.palette.base0C}"
    "${config.colorScheme.palette.base0D}"
    "${config.colorScheme.palette.base0E}"
    "${config.colorScheme.palette.base0F}"
  ];

  users.users.bolofofo = {
    isNormalUser = true;
    description = "Main user";
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { bolofofo = import ./home.nix; };
  };

  # TODO: Toggle for ALSA when needed
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # TODO: every one of these needs to go in apps
  environment.systemPackages = with pkgs; [
    wget
    libreoffice
    webcord
    python3
  ];
  programs.steam.enable = true;

  # MAYBE: openSSH could be useful
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
