{ config, pkgs, inputs, ... }:

{
  fonts.fonts = with pkgs; [
    nerdfonts
  ];
}
