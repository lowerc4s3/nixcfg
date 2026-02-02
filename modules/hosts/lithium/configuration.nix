{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.lithium = inputs.nixpkgs.lib.nixosSystem {
    modules = [self.nixosModules.lithium];
  };

  flake.nixosModules.lithium = {pkgs, ...}: {
    networking.hostName = "lithium";

    imports = [
      self.nixosModules.shared
      self.nixosModules.linux-core
      self.nixosModules.linux-desktop
      self.nixosModules.kde
    ];

    hardware = {
      cpu.amd.updateMicrocode = true;
      enableAllFirmware = true;
    };

    services.xserver.videodrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;

      # Enable nvidia-suspend/hibernate/resume services
      # and set NVreg_PreserveVideoMemoryAllocations
      powerManagement.enable = true;
    };

    boot = {
      loader = {
        systemd-boot.enable = true; # temp solution
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest; # TODO: check out zen
      supportedFileSystems = ["ntfs"];
    };

    # enable periodic ssd trim
    services.fstrim.enable = true;
  };

  system.stateVersion = "25.11";
}
