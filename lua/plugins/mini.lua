return {
  {
    "echasnovski/mini.ai",
    config = function ()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    config = function ()
      require("mini.comment").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    config = function ()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.operators",
    config = function ()
      require("mini.operators").setup()
    end
  }
}
