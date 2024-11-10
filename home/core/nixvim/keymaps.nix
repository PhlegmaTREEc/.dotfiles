{ config, lib, ...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [

      # Moving lines
      {
        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
        key = "<M-k>";
        mode  = [ "n" ];
      }
      {
        action = "<cmd>execute 'move .+' . v:count1<cr>==";
        key = "<M-j>";
        mode  = [ "n" ];
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "<M-k>";
        mode  = [ "v" ];
      }
      {
        action = ":m '>+1<CR>gv=gv";
        key = "<M-j>";
        mode  = [ "v" ];
      }

      # Buffers
      {
        action = "<cmd>BufferClose<CR>";
        key = "<leader>bx";
      }
      {
        action = "<cmd>BufferPrevious<CR>";
        key = "<leader>bb";
      }

      # Splits
      {
        action = "<cmd>vs<CR>";
        key = "<leader>bv";
      }
      {
        action = "<cmd>sp<CR>";
        key = "<leader>bh";
      }
      {
        action = "<cmd>Oil<CR>";
        key = "<leader>fo";
      }

      # ESC from search
      {
        action = "<cmd>noh<cr><esc>";
        key = "<esc>";
        mode  = [ "n" ];
      }
      {
        action = "<ESC>";
        key = "kk";
        mode  = [ "i" ];
          options = {
            silent = true;
          };
      }
 
    ];
  };
}
