{
  config,
  lib,
  ...
}: {
  config.var = {
    username = "imtraf";

    git = {
      username = "imtraf";
      email = "imtrafdev@gmail.com";
    };

    keyboardLayout = "us";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Home-manager specific variables for user ${config.var.username}.";
    };
  };
}
