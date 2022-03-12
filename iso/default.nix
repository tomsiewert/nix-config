{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../common/base
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
