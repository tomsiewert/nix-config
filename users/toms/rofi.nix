{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    home.file.".local/share/rofi/themes/base16-dracula.rasi".source =
      ../../files/rofi/rofi_theme;
  };
}
