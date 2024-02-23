{ pkgs, ... }:

let
  myAliases = {
    cat = "bat";
  };

in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    bat
    hexyl
  ];
}