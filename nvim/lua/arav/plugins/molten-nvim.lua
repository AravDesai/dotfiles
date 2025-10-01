return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    config = function()
      local py = vim.fn.expand("~/dotfiles/nvim/python_nvim/bin/python3")

      -- tell Neovim which Python to use
      vim.g.python3_host_prog = py
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20

      -- helper: start ipykernel and attach Molten
      local function start_kernel_and_attach()
        -- spawn ipykernel in background
        vim.fn.jobstart({ py, "-m", "ipykernel" }, { detach = true })

        -- attach Molten after small delay
        vim.defer_fn(function()
          -- initialize Molten but don't switch to insert mode
          local ok, _ = pcall(vim.cmd, "MoltenInit python3 --no-open")
          if not ok then
            -- fallback: just run MoltenInit and immediately stopinsert
            vim.cmd("MoltenInit python3")
            vim.cmd("stopinsert")
          end
        end, 500) -- adjust delay if needed
      end

      -- keymaps
      vim.keymap.set("n", "<leader>mi", start_kernel_and_attach,
        { desc = "Start ipykernel + attach Molten", silent = true })
      vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" })
      vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>",
        { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>",
        { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" })
      vim.keymap.set("n", "<leader>rd", ":MoltenDelete<CR>",
        { silent = true, desc = "molten delete cell" })
      vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>",
        { silent = true, desc = "hide output" })
      vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
        { silent = true, desc = "show/enter output" })
      end,
  },
}

