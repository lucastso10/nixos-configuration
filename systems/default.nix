{config, lib, pkgs, specialArgs, ...}:

let
  hostname = specialArgs.hostname;
in{
  imports = [ ./${hostname}  ];
}
