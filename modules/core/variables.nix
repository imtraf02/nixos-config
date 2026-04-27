{ lib, ... }: {
  options.var = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Shared attribute set for host- or user-specific variables.";
  };
}

