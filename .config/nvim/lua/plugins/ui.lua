-- UI related plugins
return {

    -- default colorscheme
    {
        "shaunsingh/nord.nvim",
        lazy = false, -- make sure is loaded on startup (main colorscheme)
        priority = 1000, -- ^
        config = function()
            -- load scheme
            vim.cmd([[colorscheme nord]])
        end,
    },
    
    -- which-key with lazy loading
    {
        "folke/which-key.nvim",
        lazy = true,
    },

    -- ui plugins from nvchad
    {
        "nvchad/ui",
        config = function()
            require "nvchad"
        end,
    },
    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
            require("nvconfig").base46.theme = 'nord'
        end,
    },
    {
        "nvchad/volt"
    },

    -- nvim-tree + devicons
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "configs.nvimtree"
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            dofile(vim.g.base46_cache .. "devicons")
        end,
    },









}