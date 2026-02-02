{
  flake.nixosModules.shared = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      inter
      # TODO: cjk fonts, emojis (probably just for linux)
    ];
  };
}
