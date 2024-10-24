{
  programs.nixvim = {

    #clipboard = {
    #  register = "unnamedplus";
    #  providers.wl-copy.enable = true;
    #};
    opts = {
      colorcolumn = "100"; # Columns to highlight
      cursorline = true; # Highlight the screen line of the cursor
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      foldlevel = 99; # Folds with a level higher than this number will be closed
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      laststatus = 3; # When to use a status line for the last window
      mouse = "a"; # Enable mouse control
      number = true; # Display the absolute line number of the current line
      relativenumber = true; # Relative line numbers
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      scrolloff = 6; # Number of screen lines to show around the cursor
      showmode = false;
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      signcolumn = "yes"; # Whether to show the signcolumn
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      termguicolors = true; # Disables 24-bit RGB color in the |TUI|
      spell = false; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping
      undofile = true; # Automatically save and restore undo history
      updatetime = 100; # Faster completion
    };
  };
}
