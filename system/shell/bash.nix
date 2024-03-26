{ pkgs, ... }:

let
  myAliases = {
    ll = "ls -la";
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
