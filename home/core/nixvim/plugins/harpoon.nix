{pkgs, ...}:
{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    package = pkgs.vimPlugins.harpoon2;
    #keymaps = {
    #  toggleQuickMenu = ''
    #    <leader>hh
    #  '';
    #};
  };
}
