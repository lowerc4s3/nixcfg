{
  flake.nixosModules.linux-core = {...}: {
    networking = {
      nameservers = [
        "8.8.8.8"
        "8.8.4.4"
        "2001:4860:4860::8888"
        "2001:4860:4860::8844"
      ];

      networkManager = {
        enable = true;
      };

      # not sure
      # services.openssh.enable = true;
    };
  };
}
