return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require('neo-tree').setup {}
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
        vim.keymap.set("n", "<C-m>", ":Neotree buffers reveal float<CR>", {})
    end,
}
