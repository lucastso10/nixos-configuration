{
  pkgs,
  lib,
  config,
  ...
}:
# TODO: this still doesn't work!
{
  options = with lib; {
    apps.ssh.enable = mkEnableOption "ssh";
  };

  config = lib.mkIf config.apps.roblox.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };

    users.users."bolofofo".openssh.authorizedKeys.keys = [
      #l/home/bolofofo/.ssh/windows 
    ];
  };
}
