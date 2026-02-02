{
  flake.nixosModules.kde = {pkgs, ...}: {
    services.desktopManager = {
      plasma6 = {
        enable = true;
        enableQt5Intergration = true;
      };
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
