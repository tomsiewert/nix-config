{ lib, config, sops, ... }:

{
  sops.secrets = {
    "wireguard__wg_fsn1_vpn1_privatekey" = {};
  };

  systemd.services.wg-quick-wg0.wantedBy = lib.mkForce [ ];
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.34.3.10/32" "2a01:4f8:11d:700:1011::2/128" ];
      privateKeyFile = config.sops.secrets."wireguard__wg_fsn1_vpn1_privatekey".path;
      dns = [ "8.8.8.8" ];
      peers = [
        {
          publicKey = "FycvR7no+9FXU9AYmiCyvdfWkFXW7FVkBD+/Xc4Rqi8=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "94.130.121.183:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
