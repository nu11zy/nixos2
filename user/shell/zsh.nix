{ pkgs, ... }:

let
  myAliases = {
    cat = "bat";
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
    bat
    hexyl
  ];
}
