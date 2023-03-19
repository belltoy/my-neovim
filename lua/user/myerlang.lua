local status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not status_ok then
    return
end

local parser_config = parsers.get_parser_configs()

parser_config.erlang = {
  install_info = {
    url = "~/codes/another-tree-sitter-erlang", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    -- branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "erlang", -- if filetype does not match the parser name
}
