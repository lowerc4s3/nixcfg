{
  flake.nixosModules.linux-desktop = {pkgs, ...}: {
    security.polkit.enable = true;

    # mounting and trash functionality
    services.gvfs.enable = true;

    programs.appimage = {
      enable = true;

      # automatically run appimages through appimage-run
      binfmt = true;
    };
  };
}
