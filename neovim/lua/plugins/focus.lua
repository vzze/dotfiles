return {
    'beauwilliams/focus.nvim',
    opt = true,
    cmd = { "FocusSplitLeft", "FocusSplitUp", "FocusSplitDown", "FocusSplitRight", "FocusSplitCycle" },
    config = function() require("focus").setup() end
}
