{
  config,
  lib,
  ...
}: {
  config.var = {
    username = "underdel";

    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
