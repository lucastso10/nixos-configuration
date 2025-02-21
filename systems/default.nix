{
  specialArgs,
  ...
}:

let
  hostname = specialArgs.hostname;
in
{
  imports = [
    ./${hostname}
    ./default_config.nix
  ];
}
