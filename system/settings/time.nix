{ lib, config, ... }:
let
  cfg = config.system.settings.time;
in
{
  options.system.settings.time = {
    timezone = lib.mkOption {
      type = lib.types.string;
      default = "America/Chicago";
      description = "Timezone";
    };
  };
  config = {
    time.timeZone = cfg.timezone;
  };
}
