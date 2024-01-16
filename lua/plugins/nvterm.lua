return {
    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
            vim.keymap.set(
                'n',
                '<leader>t',
                function () require("nvterm.terminal").toggle "vertical" end,
                {}
            )
            vim.keymap.set(
                't',
                '<Esc>',
                function () require("nvterm.terminal").toggle "vertical" end,
                {}
            )
        end
    }
}
