{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "Files";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
        }
      ];
    };
  };
}
