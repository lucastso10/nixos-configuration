{ lib, config, pkgs, inputs, home-manager, ... }: {
  # decided to make this not an option

  imports = [ inputs.nix-colors.homeManagerModules.default ];

  config = { colorScheme = inputs.nix-colors.harmonic16-dark; };
}
