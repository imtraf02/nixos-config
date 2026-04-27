{
  inputs,
  config,
  pkgs,
  ...
}: {
  xdg.configFile = {
    "bat/config".text = ''
      --theme="Nord"
      --style="numbers,changes,grid"
      --paging=auto
    '';
  };
}
