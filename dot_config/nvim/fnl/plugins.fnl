(let [install-path (.. (vim.fn.stdpath "data") "/site/pack/packer/start/packer.nvim")]
  (when (= "" (vim.fn.glob install-path))
    (print "installing packer...")
    (vim.fn.system ["git" "clone" "https://github.com/wbthomason/packer.nvim" install-path])))

(vim.cmd.packadd "packer.nvim")

(let [packer (require :packer)]
  (packer.startup
    (fn [use]
      (use "wbthomason/packer.nvim")

      ;; general
      (use "tpope/vim-sensible")      ;; sensible vim defaults
      (use "tpope/vim-rsi")           ;; readline keybinds
      (use "tpope/vim-repeat")        ;; repeat commands even after a plugin map
      (use "tpope/vim-commentary")    ;; comment stuf out
      (use "tpope/vim-surround")      ;; mappings to {delete,change,add} surrounding pairs
      (use "nvim-lua/plenary.nvim")   ;; the entire ecosystem uses this
      (use "junegunn/vim-easy-align") ;; ain't nobody got time to align things manually
      (use "github/copilot.vim")      ;; tab completion on steroids

      ;; git
      (use "NeogitOrg/neogit")        ;; git interface
      (use "sindrets/diffview.nvim")  ;; git diff interface
      (use "lewis6991/gitsigns.nvim") ;; in-buffer git stuff

      (use "preservim/nerdtree")   ;; does the job (pretty well tbh)
      (use "folke/which-key.nvim") ;; because I can't remeber every keybind
      (use "mbbill/undotree")      ;; because history is not linear

      ;; shell integration
      (use {1 "junegunn/fzf" :run (fn [] (vim.call "fzf#install"))})
      (use "junegunn/fzf.vim")

      (use "christoomey/vim-tmux-navigator") ;; jumping between vim and tmux, seamlessly
      (use "christoomey/vim-tmux-runner")    ;; run stuff on tmux, from vim

      ;; lsp
      (use ["williamboman/mason.nvim"         ;; lsp tools management
            "williamboman/mason-lspconfig.nvim"
            "neovim/nvim-lspconfig"])
      (use "ray-x/lsp_signature.nvim")        ;; floating signature hint
      (use "jose-elias-alvarez/null-ls.nvim") ;; hook tools into nvim lsp api
      (use "folke/trouble.nvim")              ;; make it double.

      (use ["hrsh7th/nvim-cmp"       ;; complete with:
            "hrsh7th/cmp-nvim-lsp"   ;; - lsp
            "hrsh7th/cmp-buffer"     ;; - buffer
            "hrsh7th/cmp-path"       ;; - paths
            "hrsh7th/cmp-nvim-lua"]) ;; - neovim lua api

      ;; visual
      (use "ishan9299/nvim-solarized-lua") ;; works great with lua plugins
      (use "hoob3rt/lualine.nvim")         ;; pretty line
      (use "romgrk/barbar.nvim")           ;; pretty tabline
      (use "vigoux/notifier.nvim")         ;; non-intrusive notification system

      ;; languages
      (use "nvim-treesitter/nvim-treesitter")         ;; oh that's pretty - Kramer
      (use "nvim-treesitter/nvim-treesitter-context") ;; I keep forgetting where I am

      (use "mfussenegger/nvim-dap") ;; debugger
      (use "rcarriga/nvim-dap-ui")  ;; debugger ui

      (use {1 "iamcco/markdown-preview.nvim" ;; 'cause I can't render markdown mentally
            :run (fn [] (vim.call "mkdp#util#install"))})

      (use "Wansmer/treesj")

      (use "jiangmiao/auto-pairs") ;; [({})] I only wrote half of it

      (use {1 "eraserhd/parinfer-rust" ;; the superior way of writing lisp
            :run "cargo build --release"}))))
