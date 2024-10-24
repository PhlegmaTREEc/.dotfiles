{
  programs.nixvim = {
    opts.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            path = "[path]";
          };
        };
      };
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };

          sources = [
            {name = "path";}
          ];
        };
      };
    };
  };
}
