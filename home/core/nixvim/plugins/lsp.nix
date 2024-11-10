{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      marksman = {
        enable = true;
      };
      nixd = {
        enable = true;
      };
    };
  };
}
