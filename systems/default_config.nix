{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

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
    "${config.stylix.base16Scheme.base00}"
    "${config.stylix.base16Scheme.base01}"
    "${config.stylix.base16Scheme.base02}"
    "${config.stylix.base16Scheme.base03}"
    "${config.stylix.base16Scheme.base04}"
    "${config.stylix.base16Scheme.base05}"
    "${config.stylix.base16Scheme.base06}"
    "${config.stylix.base16Scheme.base07}"
    "${config.stylix.base16Scheme.base08}"
    "${config.stylix.base16Scheme.base09}"
    "${config.stylix.base16Scheme.base0A}"
    "${config.stylix.base16Scheme.base0B}"
    "${config.stylix.base16Scheme.base0C}"
    "${config.stylix.base16Scheme.base0D}"
    "${config.stylix.base16Scheme.base0E}"
    "${config.stylix.base16Scheme.base0F}"
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

  # home-manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users = {
      bolofofo = import ./home.nix;
    };
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
  ];

  # MAYBE: openSSH could be useful
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.autoUpgrade = {
    enable = true;
    flake = "github:lucastso10/nixos-configuration";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
