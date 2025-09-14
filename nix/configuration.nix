{ config, pkgs, ... }:

{
# imports 
imports =[ <home-manager/nixos> ./module.nix ];

# all the programs and one line commands !
  programs.zsh = {
      enble = true; 
  OhMyZsh = {
       enable = true;
      plugins = [ "git" "zsh-history-substring-search" ];
      theme = "robbyrussell";
    };
  zoxide = {
      enble = true;
    };
  };
  programs.ly = {
      enble = true;
    };

#hyprland configs  
programs.hyprland = {
    enble = true;
  };
#experimental flakes 
nix.settings.experimental-features = ["nix-command" "flakes"];
# all the pkgs and dependences !
  enviroment.systempackages = with pkgs; [
  git
  curl
  wget
  starship
  oh-my-zsh
    zsh-completions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-history-substring-search
    hypridle
    hyprlock
    hyprpaper
    swww
    rofi-wayland
    swaybg
    wl-clipboard
    grim
    slurp
    nwg-look 
    hyprpolkitagent
    wlogout
    nwg-displays
    cliphist
    nautilus
    ags
    libsForQt5.qt5ct
    catppuccin-qt5ct
    kdePackages.qt6ct
    wallust
    swappy
    btop
    cava
    fastfetch
    neovim
    bluez
    blueman
    curl
    git
    pciutils
    nerd-fonts.victor-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fantasque-sans-mono
  ]

# enble home-manager 
  home-manager.users.root-ijadux2 = {
      home.homeDirectory = "/home/root-ijadux2"
      home.NixpkgsReleaseCheck = {
          enble = false;
        };
       home.stateVersion = "25.05";
       nixpkgs.configs = {
          allowUnfree = true;
        };
  };
      home.packages = with pkgs; [
      sl
      cmatrix
      kitty
      ghostty
      ];

      home.sessionsVariable = {
          EDITOR = "nvim";
        };

        programs.home-manager = {
            enble = true;
          };



# boot loaders 
boot.loader.systemd-boot.enble = true;
boot.loader.efi.canTouchEfiVariables = true;

# networking and connectivity
networking.hostname = "nix-btw";
networking.networkmanager.enble = true;

#timeZone 
time.timeZone = "Asia/Kolkata";
service.printing.enble = false;

#audio and sound adjestments 
service.pulseaudio.enble = false;
service.pipewire.enble = {
    enble = true;
    alsa.enble = true;
    alsa.support32Bit = true; 
    pulse.enble = true;
    thisjack.enble = true; 
  }
security.rtkit.enble = true;

#users and root-configurations
users.users.root-ijadux2 = {
    inNormalUsers = true;
    description = "root-ijadux2";
    shell = "pkgs.zsh";
    extraGroups = ["networkmanager" "wheel"];
#root pkgs 
    packages = with pkgs; [
    zsh
    zoxide
    ly
    vscodium
    hyprland
    waybar
    ];
  }
#some extra settings for pkgs and users 
nixpkgs.config.allowUnfree = {
    enble = true;
  };

# firefox enble
programs.firefox = {
    enble = true;
  };

# system version 
systems.stateVersion = "25.05";

  }
