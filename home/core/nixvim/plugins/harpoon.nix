{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    package = pkgs.vimPlugins.harpoon2
  };
}
