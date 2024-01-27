local crates = require "crates"
local keymap = vim.keymap.set
local show_features_popup = function()
  crates.show_features_popup()
  crates.show_features_popup()
end
crates.setup {
  src = {
    cmp = {
      enabled = true,
    },
  },
}
keymap("n", "<leader>lct", crates.toggle, { desc = "Toggle crates" })
keymap("n", "<leader>lcr", crates.reload, { desc = "Reload Crates" })

keymap("n", "<leader>lcv", crates.show_versions_popup, { desc = "Show crates version" })
keymap("n", "<leader>lcf", show_features_popup, { desc = "Show show features popup" })
keymap("n", "<leader>lcd", crates.show_dependencies_popup, { desc = "Show dependencies popup" })

keymap("n", "<leader>lcu", crates.update_crate, { desc = "update crate" })
keymap("v", "<leader>lcu", crates.update_crates, { desc = "update crate" })
keymap("n", "<leader>lca", crates.update_all_crates, { desc = "update all crates" })
keymap("n", "<leader>lcU", crates.upgrade_crate, { desc = "upgrade crate" })
keymap("v", "<leader>lcU", crates.upgrade_crates, { desc = "upgrade crate" })
keymap("n", "<leader>lcA", crates.upgrade_all_crates, { desc = "upgrade all crates" })

keymap("n", "<leader>lce", crates.expand_plain_crate_to_inline_table, { desc = "expand plain crate to inline table" })
keymap("n", "<leader>lcE", crates.extract_crate_into_table, { desc = "extract crate into table" })

keymap("n", "<leader>lch", crates.open_homepage, { desc = "open homepage" })
keymap("n", "<leader>lcr", crates.open_repository, { desc = "open repository" })
keymap("n", "<leader>lcd", crates.open_documentation, { desc = "open documentation" })
keymap("n", "<leader>lcc", crates.open_crates_io, { desc = "open crates io" })
