{ config, pkgs, ... }:

{
  
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05"; 
  nixpkgs.config = {
  allowUnfree = true;
};
  
  home.packages = with pkgs; [
   obsidian 
  ];

  home.file = {
    
  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
