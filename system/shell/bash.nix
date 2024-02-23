{ pkgs, ... }:

let
  myAliases = {
    cat = "bat";
  };

in {
  programs.bash = {
    enableCompletion = true;
    shellAliases = myAliases;
  };

  environment.systemPackages = with pkgs; [
    bat
    hexyl
  ];
}