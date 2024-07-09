local opts = {
  cmd = { 'ltex-ls' },   -- add this if you install ltex-ls yourself
  settings = {
    ltex = {
      enabled = {
        "latex", "tex", "bib", "markdown",
        "shellscript", "c", "cpp", "clojure", "coffeescript",
        "elixier", "elm", "erlang", "go", "haskell", "java", "javascript", "javascriptreact",
        "julia", "kotlin", "lisp", "lua", "python", "ruby", "rust", "swift", "scala",
        "typescript", "typescriptreact"
      },
      language = "en",
      diagnosticSeverity = "information",
      setenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en",
      },
      trace = { server = "verbose" },
      dictionary = {},
      disabledRules = {},
      hiddenFalsePositives = {},
    },
  },
}

return opts
