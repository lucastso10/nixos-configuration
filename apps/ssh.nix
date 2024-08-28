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
      openFirewall = true;
    };

    users.users."bolofofo".openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOacDoTG1OI9w/TPtZEoRyDbZGZgQaF48GEMf5qCN/7 bolofofo@punished"
    ];
  };
}
