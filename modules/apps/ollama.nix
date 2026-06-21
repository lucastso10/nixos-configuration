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
      };
    };
}
