{ ... }: {
  users.users = {
    imtraf = {
      isNormalUser = true;
      description = "Imtraf";
      extraGroups = ["networkmanager" "wheel"];
    };

    underdel = {
      isNormalUser = true;
      description = "Underdel";
      extraGroups = ["networkmanager"];
      initialHashedPassword = "$6$qw1tp4FBuOQTH7gz$hC7C6Lhj020Ab7q/T7AaN0/cxBiskgH0O/AFA5.h0.IloDORAIzS6Ldfm6wLF22m0mLbBQJWpOzL1VMF9gcgm.";
    };
  };

  security.sudo.extraRules = [
    {
      users = ["imtraf"];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}

