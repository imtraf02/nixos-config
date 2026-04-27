{
  pkgs,
  config,
  ...
}: let
  username = config.var.git.username;
  email = config.var.git.email;
in {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = username;
        email = email;
      };

      alias = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential = {
        helper = "manager";
        "https://github.com".username = username;
        credentialStore = "cache";
      };
    };

    ignores = [
      ".cache/"
      ".direnv/"
      "node_modules"

      ".DS_Store"
      ".idea"
      "*.swp"
      "*.elc"
    ];
  };
}
