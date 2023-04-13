{ lib, config, sops, ... }:

{
  sops.secrets = {
    "wireguard__wg_egh_privatekey" = {};
  };

  systemd.services.wg-quick-wg0.wantedBy = lib.mkForce [ ];
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "172.30.254.2/32" ];
      privateKeyFile = config.sops.secrets."wireguard__wg_egh_privatekey".path;
      peers = [
        {
          publicKey = "TI8ybamlUvBYMl6t0/AfjWNSZkfLzcg0ylepSme3LyI=";
          allowedIPs = [ "172.30.254.0/24" "10.40.0.0/24" "10.61.8.0/24" ];
          endpoint = "92.246.85.201:51820";
        }
      ];
    };
  };
}
