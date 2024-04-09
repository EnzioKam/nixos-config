{
  programs.nixvim = {
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      backspace = "2";
      completeopt = "menuone,noinsert,noselect";
      cursorline = true;
      display = "lastline";
      expandtab = true;
      ignorecase = true;
      linespace = 5;
      list = true;
      mouse = "a";
      number = true;
      pumheight = 20;
      report = 0;
      scrolloff = 4;
      shiftround = true;
      shiftwidth = 2;
      showmatch = true;
      showmode = true;
      sidescrolloff = 8;
      smartcase = true;
      smartindent = true;
      softtabstop = 2;
      splitbelow = true;
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 500;
      wildmode = "list,longest";
      wrap = false;
    };
  };
}
