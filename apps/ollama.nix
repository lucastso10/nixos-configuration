{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    apps.ollama.enable = mkEnableOption "ollama";
  };

  config = lib.mkIf config.apps.ollama.enable {
    services.ollama = {
      enable = true;
      acceleration = "rocm";
      host = "0.0.0.0";
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION_0 = "10.3.0";
      };
      openFirewall = true;
    };
  };
}
