{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.vmium = inputs.nixpkgs.lib.nixosSystem {
    modules = [self.nixosModules.vmium];
  };

  flake.nixosModules.vmium = {pkgs, ...}: {
    networking.hostName = "vmium";

    imports = [
      self.nixosModules.shared
      self.nixosModules.linux-core
      self.nixosModules.linux-desktop
      self.nixosModules.kde
    ];

    boot = {
      loader = {
        systemd-boot.enable = true; # temp solution
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest; # TODO: check out zen
      supportedFilesystems = ["ntfs"];
    };

    system.stateVersion = "25.11";
  };
}
