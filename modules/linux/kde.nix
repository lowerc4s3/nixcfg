{
  flake.nixosModules.kde = {pkgs, ...}: {
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
    services.displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
  };
}
