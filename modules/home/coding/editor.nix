{ pkgs, ... }:

let
  settings = builtins.readFile ../../../assets/other/zed.json;
in
{
  programs.zed-editor = {
    enable = true;
    userSettings = (builtins.fromJSON settings);
    installRemoteServer = true;
  };

  programs.vscode = {
    enable = true;
  };

  home.packages = with pkgs; [
    antigravity-cli
    antigravity-ide
    opencode
  ];
}
