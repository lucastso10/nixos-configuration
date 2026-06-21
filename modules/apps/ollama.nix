{
  ...
}:
{
  flake.modules.nixos.ollama =
    { ... }:
    {
      services.ollama = {
        enable = true;
        host = "0.0.0.0";
        openFirewall = true;
        environmentVariables = {
          HSA_OVERRIDE_GFX_VERSION = "10.3.0";
        };
      };
    };
}
