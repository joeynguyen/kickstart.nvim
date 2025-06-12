local ls = require 'luasnip'
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- ls.add_snippets({ "javascript", "typescript", "javascriptreact", "typescriptreact" },
--   {                                 -- Add support for .js, .ts, .jsx, and .tsx
--     s("cl", {                       -- Trigger: 'cl'
--       t("console.log("),
--       t('"'), i(1, "text"), t('"'), -- $1 with placeholder "text"
--       t(", "), i(2, "variable"),    -- $2 with placeholder "variable"
--       t(");"),
--     }),
--   })

local M = {
  ls.parser.parse_snippet({ trig = 'cl' }, 'console.log(\'${1:text}\', ${2:variable})'),
  -- ls.parser.parse_snippet(
  --   "cl",                                      -- Trigger: 'cl'
  --   'console.log("${1:text}", ${2:variable});' -- Snippet body with placeholders
  -- ),
  ls.parser.parse_snippet({ trig = 'ct' }, 'const ${1:name}: ${2:type} = ${3:assign}'),
  ls.parser.parse_snippet({ trig = 'cat' }, 'const ${1:name}: ${2:type} = await ${3:assign}'),
  ls.parser.parse_snippet({ trig = 'lt' }, 'let ${1:name}: ${2:type} = ${3:assign}'),
  ls.parser.parse_snippet({ trig = 'lat' }, 'let ${1:name}: ${2:type} = await ${3:assign}'),
  ls.parser.parse_snippet({ trig = 'aft' }, '(${1:params}): ${2:type} => {\n\t$0\n}'),
  ls.parser.parse_snippet({ trig = 'tr' }, 'if ${1:[[ ${2:word} -eq ${3:word2} ]]}; then\n\t$4\nfi'),
}

return M
