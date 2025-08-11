local ls = require 'luasnip'

local M = {
  ls.parser.parse_snippet({ trig = 'cl' }, "console.log('${1}', ${2})"),
  ls.parser.parse_snippet({ trig = 'ct' }, 'const ${1}: ${2} = ${3}'),
  ls.parser.parse_snippet({ trig = 'cat' }, 'const ${1}: ${2} = await ${3}'),
  ls.parser.parse_snippet({ trig = 'lt' }, 'let ${1}: ${2} = ${3}'),
  ls.parser.parse_snippet({ trig = 'lat' }, 'let ${1}: ${2} = await ${3}'),
  ls.parser.parse_snippet({ trig = 'aft' }, '(${1}): ${2} => {\n\t$0\n}'),
}

return M
