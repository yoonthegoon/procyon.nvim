vim.opt.background = "dark"
vim.g.colors_name = "lush_template"
package.loaded["lush_theme.lush_template"] = nil

-- include our theme file and pass it to lush to apply
require("lush")(require("lush_theme.lush_template"))
