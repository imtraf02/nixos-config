{
  inputs,
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    # Define custom Fish functions
    functions = {
      fish_prompt = ''
        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n "<nix-shell> "
          end
        )

        echo -n "$nix_shell_info"
        echo -n (set_color green)
        echo -n (prompt_pwd)
        echo -n (set_color normal)
        echo "> "
      '';
    };

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      nrt = "sudo nixos-rebuild test";
      cls = "clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    # You can also add shellInit for other configurations if needed
    # shellInit = ''
    #   # Other fish configurations
    # '';
  };
}
