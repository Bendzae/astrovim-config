-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- ["ä"] = { "[" },
    ["ät"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
    ["öt"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },
    ["äb"] = { function()
      require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
    end, desc = "Next buffer"
    },
    ["öb"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["äg"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["ög"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },


    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
