return {
  {
      "vhyrro/luarocks.nvim",
      priority = 1001, -- this plugin needs to run before anything else
      opts = {
          rocks = { "magick" },
      },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      '3rd/image.nvim',
    },
    config = function()
      require("image").setup({
        integrations = {
          markdown = {
            only_render_image_at_cursor = true,
          },
        },
      })
    end
  }
}
