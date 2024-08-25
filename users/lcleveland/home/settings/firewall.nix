{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    networking.firewall.allowedTCPPorts = [ 11434 ];
  };
}
