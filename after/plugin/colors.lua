function MakeColor(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    -- For making transparent background
    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

MakeColor()
