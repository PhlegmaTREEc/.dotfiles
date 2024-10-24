{
  imports = [
    ./plugins/plugs.nix
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.dracula.enable = true;
  };
}
