local opts = {
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  linters_by_ft = {
    python = { "mypy", "ruff" },
  },
}
return opts
