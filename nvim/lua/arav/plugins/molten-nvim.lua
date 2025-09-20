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

      -- map <localleader>ik → start kernel + attach
      vim.keymap.set("n", "<leader>ip", start_kernel_and_attach,
        { desc = "Start ipykernel + attach Molten", silent = true })
      end,
  },
}

