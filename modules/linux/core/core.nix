{
  flake.nixosModules.linux-core = {pkgs, ...}: {
    users.users.lowerc4s3 = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh; # mb i'll try nushell one day
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
    };

    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };

    security.sudo.enable = true;
  };
}
