{ config, lib, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.unstable.OVMFFull.fd ];

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
