return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "yaml" },
        }),
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"

            if vim.g.os == "Windows" then
              return { "--python-executable", virtual .. "/Scripts/python" }
            else
              return { "--python-executable", virtual .. "/bin/python3" }
            end
          end,
        }),
      }
    })
  end
}
