{ config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = "\\";
      maplocalleader = "\\";
    };
    
    keymaps = let
      normal = 
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          # move current line up/down
          # M = Alt key
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+<CR>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
    in
      config.nixvim.helpers.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual);
  };
}
