return {
    'terrortylor/nvim-comment',
    lazy = true,
    cmd = "CommentToggle",
    config = function()
        require("nvim_comment").setup({ comment_empty = false, create_mappings = false })
    end
}
