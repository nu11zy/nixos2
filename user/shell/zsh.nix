{ pkgs, ... }:

let
  myAliases = {
    ll = "ls -la";
  };

in {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
  ];
}
