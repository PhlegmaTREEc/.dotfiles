{
  imports = [
    ./plugins/plugs.nix
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
  };
}
