-- Attempt at overriding colors with Ultraviolent theme
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    local color = require("onedarkpro.helpers")

    require("onedarkpro").setup({
      -- use the Treesitter ":Inspect" command to find these properties
      highlights = {
        ["@property"] = { fg = "${white}" },
        ["@lsp.typemod.property.declaration.typescript"] = { fg = "${white}" },
        ["@lsp.typemod.property.declaration.typescriptreact"] = { fg = "${white}" }, -- TS type properties

        ["@lsp.type.property.javascript"] = { fg = "${purple}" },                    -- JSON properties
        ["@lsp.type.property.javascriptreact"] = { fg = "${purple}" },               -- JSON properties
        ["@lsp.type.property.typescript"] = { fg = "${purple}" },                    -- JSON properties
        ["@lsp.type.property.typescriptreact"] = { fg = "${purple}" },               -- JSON properties
        -- ["@text.uri.comment"] = { fg = "${cyan}" },
        -- ["@text.uri"] = { fg = "${cyan}" },

        ["@property.json"] = { fg = "${orange}" },
        ["@string.special.url"] = { fg = "${cyan}" },
        ["@constructor"] = { fg = "${white}" },
        ["@operator"] = { fg = "${red}" },
        ["@keyword.function"] = { fg = "${cyan}" },
        ["@keyword.operator"] = { fg = "${red}" },                        -- `new`
        ["@keyword.operator.tsx"] = { fg = "${blue}" },                   -- `typeof`
        ["@keyword.operator.typescript"] = { fg = "${blue}" },            -- `typeof`
        ["@keyword.exception.tsx"] = { fg = "${blue}" },                  -- `try/catch`
        ["@keyword.exception.typescript"] = { fg = "${red}" },            -- `try/catch`

        ["@lsp.type.class.typescript"] = { fg = "${purple}" },            -- Classes
        ["@lsp.type.class.typescriptreact"] = { fg = "${purple}" },       -- Classes
        ["@lsp.mod.defaultLibrary.typescript"] = { fg = "${blue}" },      -- `Number`
        ["@lsp.mod.defaultLibrary.typescriptreact"] = { fg = "${blue}" }, -- `Number`

        ["@keyword.import"] = { fg = "${red}" },
        ["@keyword.repeat"] = { fg = "${green}" },
        ["@keyword.return"] = { fg = "${red}" },
        ["@keyword.conditional"] = { fg = "${red}" }, -- `try/catch`
        ["@function"] = { fg = "${green}" },
        ["@function.method"] = { fg = "${cyan}" },
        ["@lsp.typemod.member.defaultLibrary.typescript"] = { fg = "${cyan}" },

        ["@function.macro"] = { fg = "${purple}" },
        ["@variable"] = { fg = "${white}" },
        ["@variable.member"] = { fg = "${purple}" },
        ["@variable.parameter"] = { fg = "${orange}" },

        ["@constant"] = { fg = "${white}" },

        -- Variables
        ["@variable.tsx"] = { fg = "${white}" },
        ["@variable.typescript"] = { fg = "${white}" },
        -- Variables - functions
        ["@lsp.type.function.typescript"] = { fg = "${white}" },
        ["@lsp.type.function.typescriptreact"] = { fg = "${white}" },
        ["@lsp.mod.local.typescript"] = { fg = "${white}" },            -- local functions
        ["@lsp.mod.local.typescriptreact"] = { fg = "${white}" },       -- local functions
        ["@lsp.mod.declaration.typescript"] = { fg = "${green}" },      -- `component Name`
        ["@lsp.mod.declaration.typescriptreact"] = { fg = "${green}" }, -- `component Name`
        ["@lsp.mod.readonly.typescript"] = { fg = "${green}" },         -- `react hooks`
        ["@lsp.mod.readonly.typescriptreact"] = { fg = "${green}" },    -- `react hooks`

        ["@function.call.kotlin"] = { fg = "${cyan}" },
        ["@function.call.tsx"] = { fg = "${white}" },
        ["@function.tsx"] = { fg = "${green}" },
        ["@lsp.typemod.variable.defaultLibrary.typescript"] = { fg = "${blue}" },
        ["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { fg = "${blue}" },
        ["@lsp.typemod.function.local.typescript"] = { fg = "${white}" },
        ["@lsp.typemod.function.local.typescriptreact"] = { fg = "${white}" },
        ["@lsp.typemod.parameter.declaration.typescript"] = { fg = "${orange}" },
        ["@lsp.typemod.parameter.declaration.typescriptreact"] = { fg = "${orange}" },

        -- String inside JSX tag
        ["@markup.heading.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },
        ["@markup.heading.1.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },
        ["@markup.heading.2.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },
        ["@markup.heading.3.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },
        ["@markup.heading.4.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },
        ["@none.tsx"] = { fg = "${jsx_text}", italic = true, bold = true },

        -- Types
        Type = { fg = "${green}" },
        ["@type.tsx"] = { fg = "${green}" },
        ["@variable.builtin"] = { fg = "${blue}" },
        ["@type.builtin.tsx"] = { fg = "${blue}" },
        ["@function.builtin.kotlin"] = { fg = "${blue}" },

        ["@lsp.typemod.function.defaultLibrary.typescript"] = { fg = "${blue}" },
        ["@lsp.typemod.function.defaultLibrary.typescriptreact"] = { fg = "${blue}" },
        ["@lsp.type.class"] = { fg = "${green}" },
        ["@lsp.type.interface"] = { fg = "${green}" },
        ["@lsp.type.interface.typescript"] = { fg = "${green}" },
        ["@lsp.type.interface.typescriptreact"] = { fg = "${green}" },
        ["@lsp.type.namespace.typescript"] = { fg = "${orange}" },
        ["@lsp.type.namespace.typescriptreact"] = { fg = "${orange}" },


        ["@tag.tsx"] = { fg = "${purple}" },
        ["@tag.builtin.tsx"] = { fg = "${red}" },
        ["@tag.delimiter.tsx"] = { fg = "${white}" },
        ["@tag.attribute.tsx"] = { fg = "${green}", italic = true },

        ["@number.json"] = { fg = "${purple}" },
        ["@boolean.json"] = { fg = "${purple}" },
        ["@odp.braces.json"] = { fg = "${white}" },
        ["@constructor.lua"] = { fg = "${purple}" },

        ["@punctuation.special"] = { fg = "${purple}" }, -- ${variable} inside string interpolation - JS, Kotlin
        ["@punctuation.bracket.kotlin"] = { fg = "${white}" },
        ["@punctuation.bracket.lua"] = { fg = "${white}" },
        ["@odp.expression.punctuation.bracket.javascript"] = { fg = "${white}" },
        ["@odp.expression.punctuation.bracket.javascriptreact"] = { fg = "${white}" },
        ["@punctuation.bracket.javascript"] = { fg = "${white}" },
        ["@punctuation.bracket.javascriptreact"] = { fg = "${white}" },
        ["@punctuation.bracket.typescript"] = { fg = "${white}" },
        ["@punctuation.bracket.typescriptreact"] = { fg = "${white}" },
        ["@punctuation.bracket.tsx"] = { fg = "${white}" },

        ["@odp.operator.fat_arrow.tsx"] = { fg = "${cyan}" },
        ["@string"] = { link = "String" },

        -- XML
        -- ["@tag"] = { fg = "${red}" },
        -- ["@tag.attribute"] = { fg = "${red}" },
        -- ["@tag.delimiter"] = { fg = "${white}" },

        Identifier = { fg = "${cyan}" },
        Constant = { fg = "${purple}" },
        Keyword = { fg = "${cyan}" },
        String = { fg = "${yellow}" },
        Error = { fg = "${red}" },

        Comment = { fg = "${comment}" },
        -- Number = { fg = "${purple}" },
        -- Function = { fg = "${purple}" },
        -- Statement = { fg = "${purple}" },
        -- Identifier = { fg = "${purple}" },

        -- Diagnostics
        DiagnosticVirtualTextHint = { fg = "${orange}" },
        -- DiagnosticVirtualTextError
        -- DiagnosticVirtualTextWarn
        -- DiagnosticVirtualTextInfo = { fg = "${red}" },

        -- Git
        GitSignsAdd = { fg = "${cyan}" },
        GitSignsChange = { fg = "${orange}" },

      },
      colors = {
        jsx_text = color.darken("#b5b5b5", 20),
        red = "#ff0090",
        orange = "#FD971E",
        yellow = "#ebe087",
        green = "#b6ff00",
        cyan = "#47e0fb",
        blue = "#0effbb",
        purple = "#e681ff",
        white = "#f9f9f5",
        -- black = "#242728",
        gray = "#e1e1e1",
        highlight = "#d731ff",
        comment = "#75715E",
        -- none = "NONE",
        -- bg = "#fafafa",
        -- fg = "#6a6a6a",
        dark = { bg = "#242728" },
        -- light = { bg = "" },
      },
    })

    vim.cmd("colorscheme onedark")
  end,
}

-- palette = 0=#242728
-- palette = 1=#ff0090
-- palette = 2=#b6ff00
-- palette = 3=#fff727
-- palette = 4=#47e0fb
-- palette = 5=#d731ff
-- palette = 6=#0effbb
-- palette = 7=#e1e1e1
-- palette = 8=#636667
-- palette = 9=#fb58b4
-- palette = 10=#deff8c
-- palette = 11=#ebe087
-- palette = 12=#7fecff
-- palette = 13=#e681ff
-- palette = 14=#69fcd3
-- palette = 15=#f9f9f5
-- background = #242728
-- foreground = #c1c1c1
-- cursor-color = #c1c1c1
-- selection-background = #574c49
-- selection-foreground = #c3c7cb



-- vim.api.nvim_set_hl(0, "@annotation", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@attribute", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
-- vim.api.nvim_set_hl(0, "@character", { link = "Character" })
-- vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
-- vim.api.nvim_set_hl(0, "@comment.lua", { fg = "#7f848e", italic = true })
-- vim.api.nvim_set_hl(0, "@conditional", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@conditional.python", { fg = "#c678dd", italic = true })
-- vim.api.nvim_set_hl(0, "@constant", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@constant.builtin.php", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@constant.builtin.rust", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@constant.macro", { link = "@constant" })
-- vim.api.nvim_set_hl(0, "@constructor", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@constructor.javascript", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@constructor.python", { bold = true, fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@error", { link = "Error" })
-- vim.api.nvim_set_hl(0, "@exception", { link = "Exception" })
-- vim.api.nvim_set_hl(0, "@field", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@field.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@field.rust", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@field.yaml", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@float", { link = "Float" })
-- vim.api.nvim_set_hl(0, "@function", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@function.builtin.lua", { bold = true, fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@function.builtin.php", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@function.builtin.rust", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@function.call.lua", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.call.ruby", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.call.tsx", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.call.typescript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.call.yaml", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@function.macro", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.macro.rust", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@function.ruby", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.tsx", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@function.typescript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@include", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@include.ruby", { fg = "#61afef", italic = true })
-- vim.api.nvim_set_hl(0, "@keyword", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.javascript", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.lua", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.operator.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@keyword.return", { link = "@keyword" })
-- vim.api.nvim_set_hl(0, "@keyword.return.javascript", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@keyword.rust", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@label", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@label.ruby", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@label.rust", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@method", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.call.javascript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.call.php", { link = "@method.php" })
-- vim.api.nvim_set_hl(0, "@method.call.python", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.call.typescript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.javascript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.lua", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.php", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.typescript", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@method.vue", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@namespace", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@namespace.php", { bold = true, fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@number", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@operator", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@operator.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@operator.rust", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@operator.toml", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@operator.vue", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@parameter", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@parameter.lua", { fg = "#abb2bf", italic = true })
-- vim.api.nvim_set_hl(0, "@parameter.markdown_inline", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@parameter.reference", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@parameter.ruby", { fg = "#abb2bf", italic = true })
-- vim.api.nvim_set_hl(0, "@parameter.rust", { fg = "#e06c75", italic = true })
-- vim.api.nvim_set_hl(0, "@parameter.tsx", { fg = "#e06c75", italic = true })
-- vim.api.nvim_set_hl(0, "@parameter.typescript", { fg = "#e06c75", italic = true })
-- vim.api.nvim_set_hl(0, "@parameter.yaml", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@property", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@property.toml", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.javascript", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.lua", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.ruby", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.tsx", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.typescript", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.yaml", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Delimiter" })
-- vim.api.nvim_set_hl(0, "@punctuation.delimiter.markdown_inline", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@repeat", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@string", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@string.escape", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@string.regex", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@string.special", { link = "Special" })
-- vim.api.nvim_set_hl(0, "@string.yaml", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@symbol", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@symbol.ruby", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "@tag", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@property" })
-- vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = "#d19a66", italic = true })
-- vim.api.nvim_set_hl(0, "@tag.attribute.vue", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "Delimiter" })
-- vim.api.nvim_set_hl(0, "@text", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.danger", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@text.environment", { link = "Macro" })
-- vim.api.nvim_set_hl(0, "@text.environment.name", { link = "Type" })
-- vim.api.nvim_set_hl(0, "@text.literal", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.literal.markdown_inline", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "@text.math", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.note", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.reference", { link = "@text" })
-- vim.api.nvim_set_hl(0, "@text.reference.markdown_inline", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@text.strike", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.strong", { link = "Bold" })
-- vim.api.nvim_set_hl(0, "@text.strong.markdown_inline", { bold = true, fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@text.title", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@text.title.markdown", { bold = true, fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@text.underline", { link = "Underlined" })
-- vim.api.nvim_set_hl(0, "@text.uri", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@text.uri.markdown_inline", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@text.warning", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@type", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@type.builtin.tsx", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "@variable", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "@variable.builtin.javascript", { fg = "#e5c07b", italic = true })
-- vim.api.nvim_set_hl(0, "@variable.builtin.python", { fg = "#e5c07b", italic = true })
-- vim.api.nvim_set_hl(0, "@variable.javascript", { fg = "#e06c75", italic = true })
-- vim.api.nvim_set_hl(0, "@variable.typescript", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "Bold", { bold = true })
-- vim.api.nvim_set_hl(0, "Boolean", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "Character", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#2d313b" })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#7f848e" })
-- vim.api.nvim_set_hl(0, "Conditional", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Constant", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "Cursor", { bg = "#c678dd", fg = "#282c34" })
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#282c34", fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "CursorLineNrNC", { bg = "#2d313b", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "CursorLineNrNCQuickFix", { bg = "#282c34", fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Define", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Delimiter", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#003e4a" })
-- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#501b20" })
-- vim.api.nvim_set_hl(0, "DiffText", { bg = "#005869" })
-- vim.api.nvim_set_hl(0, "Directory", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#282c34" })
-- vim.api.nvim_set_hl(0, "Error", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "Exception", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Float", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#22252C", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Folded", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "FoldedNC", { bg = "#2d313b", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Function", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "Identifier", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "IncSearch", { bg = "#414858", fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "Include", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Italic", { italic = true })
-- vim.api.nvim_set_hl(0, "Keyword", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Label", { fg = "#e06c75" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "LineNrNC", { bg = "#2d313b", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Macro", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "MatchParen", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "ModeMsg", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "MsgArea", { link = "ModeMsg" })
-- vim.api.nvim_set_hl(0, "MsgSeparator", { link = "ModeMsg" })
-- vim.api.nvim_set_hl(0, "NonText", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#22252C" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "Number", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "OneDarkPro", { fg = "#FF0000" })
-- vim.api.nvim_set_hl(0, "Operator", { fg = "#56b6c2" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#22252C" })
-- vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2E323A" })
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2E323A" })
-- vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#94969A" })
-- vim.api.nvim_set_hl(0, "PreCondit", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "PreProc", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "Question", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "QuickFixLineNC", { bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "Repeat", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Search", { bg = "#414858", fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "SignColumnNC", { bg = "#2d313b", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Special", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#7f848e" })
-- vim.api.nvim_set_hl(0, "SpellBad", { fg = "#e06c75", sp = "#e06c75", undercurl = true })
-- vim.api.nvim_set_hl(0, "SpellCap", { fg = "#e06c75", sp = "#e06c75", undercurl = true })
-- vim.api.nvim_set_hl(0, "SpellLocal", { fg = "#e06c75", sp = "#e06c75", undercurl = true })
-- vim.api.nvim_set_hl(0, "SpellRare", { fg = "#e06c75", sp = "#e06c75", undercurl = true })
-- vim.api.nvim_set_hl(0, "Statement", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#282c34", bold = true, fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "StorageClass", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "String", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "Structure", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Substitute", { bg = "#e5c07b", fg = "#282c34" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "#282c34" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#c678dd", fg = "#282c34" })
-- vim.api.nvim_set_hl(0, "TermCursor", { bg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "TermCursorNC", { bg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Title", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "Todo", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Type", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "Typedef", { fg = "#c678dd" })
-- vim.api.nvim_set_hl(0, "Underlined", { underline = true })
-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "Visual", { bg = "#414858" })
-- vim.api.nvim_set_hl(0, "VisualNOS", { link = "Visual" })
-- vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "Whitespace", { fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "WildMenu", { bg = "#61afef", fg = "#282c34" })
-- vim.api.nvim_set_hl(0, "WinBar", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "WinBarNC", { bg = "#282c34", fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#282c34", fg = "#5c6370" })
-- vim.api.nvim_set_hl(0, "diffAdded", { fg = "#98c379" })
-- vim.api.nvim_set_hl(0, "diffChanged", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "diffFile", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "diffLine", { fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "diffNewFile", { fg = "#e5c07b" })
-- vim.api.nvim_set_hl(0, "diffRemoved", { fg = "#e06c75" })

-- return {
--   -- https://github.com/folke/tokyonight.nvim
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("tokyonight").setup({
--       style = "moon", -- moon | storm | night | day
--     })
--     vim.cmd [[colorscheme tokyonight]]
--   end,
-- }

-- Other themes I tried but I still prefer TokyoNight over:
--   - https://github.com/sontungexpt/witch
--   - https://github.com/oxfist/night-owl.nvim
--   - https://github.com/shaunsingh/moonlight.nvim
--   - https://github.com/maxmx03/fluoromachine.nvim
--   - https://github.com/navarasu/onedark.nvim
--   - https://github.com/olimorris/onedarkpro.nvim
