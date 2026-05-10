return {
  -- Automatic pair character actions
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Text trimming
  {
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup()
    end
  },

  -- Spell fille downloader
  { "cuducos/spellfile.nvim" },
}
