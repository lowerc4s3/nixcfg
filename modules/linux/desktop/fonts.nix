{
  flake.nixosModules.linux-desktop = {...}: {
    fonts.fontconfig = {
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };

      defaultFonts = {
        monospace = ["JetBrains Mono"];
        # TODO: serif and sans
      };
    };
  };
}
