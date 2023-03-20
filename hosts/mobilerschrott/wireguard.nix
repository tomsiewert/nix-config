{ lib, config, pkgs, sops, ... }:

{
  sops.secrets = {
    "wireguard__wg_fsn1_vpn1_privatekey" = {};
    "wireguard__wg_egh_privatekey" = {};
  };

  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [ unstable.tailscale ];

  systemd.services.wg-quick-wg0.wantedBy = lib.mkForce [ ];
  systemd.services.wg-quick-wg1.wantedBy = lib.mkForce [ ];
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.34.3.1/32" "2a0c:9a40:8044:4::1/128" ];
      privateKeyFile = config.sops.secrets."wireguard__wg_fsn1_vpn1_privatekey".path;
      dns = [ "8.8.8.8" ];
      peers = [
        {
          publicKey = "FycvR7no+9FXU9AYmiCyvdfWkFXW7FVkBD+/Xc4Rqi8=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "45.86.126.131:51820";
          persistentKeepalive = 25;
        }
      ];
    };
    wg1 = {
      address = [ "172.30.254.2/32" ];
      privateKeyFile = config.sops.secrets."wireguard__wg_egh_privatekey".path;
      peers = [
        {
          publicKey = "TI8ybamlUvBYMl6t0/AfjWNSZkfLzcg0ylepSme3LyI=";
          allowedIPs = [ "172.30.254.0/24" "10.40.0.0/24" "10.61.8.0/24" ];
          endpoint = "92.246.85.201:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
