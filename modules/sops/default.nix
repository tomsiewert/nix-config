{ config, ... }:
{
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    defaultSopsFile = ../../hosts/${config.networking.hostName}/secrets/secrets.yaml;
  };
}
