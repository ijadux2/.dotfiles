{ config, pkgs, ... }:

{
  
  home.username = "ijadux2";
  home.homeDirectory = "/home/ijadux2";
  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "agnoster";
  programs.zsh.ohMyZsh.plugins = [ "git" "z" "sudo" "extract" ];
  programs.git.enable = true;
  programs.git.userName = "null";
  programs.git.userEmail = "null";
  programs.git.extraConfig = {
    "pull.rebase" = "true";
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim.override {
      withNodeJs = true;
      withPython = true;
      withRuby = false;
      withPerl = false;
      withLua = true;
      withNix = true;
    };
    extraConfig = ''
      set number
      set relativenumber
      set tabstop=4 
      set shiftwidth=4  
      set expandtab
      set smartindent
      set clipboard=unnamedplus
      syntax on
      filetype plugin indent on
    '';
  };
   
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
