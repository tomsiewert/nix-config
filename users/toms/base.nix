{ config, pkgs, inputs, ... }:

{
  users = {
    extraGroups."toms".gid = 1000;

    users."toms" = {
      isNormalUser = true;
      uid = 1000;
      group = "toms";
      home = "/home/toms";
      description = "Tom Siewert";
      hashedPassword = "$6$79.VsxdSujAe3LWQ$B4oyIVjrGuUUY6OKKxDgPCj1pebq0CxsW5QqVgA3w4K21hpKwxlMmM5xzD4VLfMMiZzX6TESaM7uMPXIYVAlH.";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "networkmanager" "kvm" "libvirtd" "docker" "audio" "video" "sound"
        "pulse" "input"
      ];
    };
  };
}
