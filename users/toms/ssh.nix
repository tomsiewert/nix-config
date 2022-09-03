{
  sops.secrets = {
    "ssh_id_tom" = {
      sopsFile = ../../secrets/ssh.yaml;
      owner = "toms";
      path = "/home/toms/.ssh/id_tsiewert";
      mode = "0400";
    };
  };
}
