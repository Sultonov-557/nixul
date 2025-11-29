{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vim-colors-xcode
    ];

    colorschemes.catppuccin.enable = false;

    extraConfigLua = ''
      vim.cmd.colorscheme("xcodedark")
    '';
  };
}
