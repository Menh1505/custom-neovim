vim.g.netrw_banner = 0          -- Ẩn banner khó chịu khi mở netrw
vim.g.netrw_liststyle = 3       -- Hiển thị theo dạng cây thư mục (1 = danh sách, 2 = danh sách chi tiết, 3 = cây)
vim.g.netrw_winsize = 20        -- Kích thước sidebar là 25% cửa sổ
vim.g.netrw_browse_split = 4    -- Mở file trong cửa sổ hiện tại (0: cùng cửa sổ, 1: split, 2: vertical split, 3: new tab, 4: same window)
vim.g.netrw_altv = 1            -- Luôn mở file theo kiểu vertical split
vim.g.netrw_keepdir = 0         -- Không tự động thay đổi thư mục làm việc
vim.g.netrw_localcopydircmd = 'cp -r'  -- Dùng `cp -r` thay vì `mv` khi copy thư mục
vim.g.netrw_fastbrowse = 2      -- Tăng tốc duyệt file

-- Khi mở netrw, tự động chỉnh lại chiều rộng phù hợp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.cmd("vertical resize 30")  -- Đặt chiều rộng là 30 cột

    local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = true, silent = true, desc = desc })
    end

    map("h", "-^", "Lên một thư mục")  -- Giống như Neo-tree/NvimTree
    map("H", "gh", "Hiện/ẩn file ẩn")
    map("q", ":q<CR>", "Thoát netrw")
    map(".", "gh", "Hiện/ẩn file ẩn")
    map("?", ":help netrw-quickmap<CR>", "Xem trợ giúp netrw")
  end,
})


vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true, desc = "Toggle Netrw" })
vim.keymap.set("n", "<leader>E", ":vertical Lexplore<CR>", { noremap = true, silent = true, desc = "Open Netrw (vertical)" })
