{
  flake.nixosModules.shared = {pkgs, ...}: {
    nix.settings = {
      expertimetal-features = ["flakes" "nix-command"];

      # Detect duplicate files in nix store
      # and replace them with hard links
      auto-optimize-store = true;
    };
    nixpkgs.config.allowUnfree = true;

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 14d";
      };
    };
  };
}
