{ pkgs, inputs, ... }:
{
  programs.kitty = {
      enble = true;
    };                     # Recommended terminal for Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # Example plugins (optional):
    # plugins = [];
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, RETURN, exec, kitty"
        "$mod, B, exec, brave"
        "$mod, E, exec, nautilus"
        "$mod, D, exec, rofi -show drun --show icons"
        "$mod, C, exec, codium"
        "$mod, Print, exec, grimblast copy area"
      ] ++ (builtins.concatLists (
        builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 
      ));
    };
  };
}

