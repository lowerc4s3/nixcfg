{
  flake.nixosModules.shared = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      neovim
    ];
  };
}
