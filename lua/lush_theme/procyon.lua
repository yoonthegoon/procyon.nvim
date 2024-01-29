local normal = {
	black = "#2c3d4c",
	gray = "#6a7785",
	white = "#b2bfcd",
	red = "#ca466a",
	yellow = "#937000",
	green = "#3e8500",
	cyan = "#00847a",
	blue = "#007db5",
	magenta = "#b544c6",
}
local bright = {
	black = "#3b4958",
	gray = "#8895a3",
	white = "#c6d2e1",
	red = "#ec6788",
	yellow = "#b88d00",
	green = "#4fa700",
	cyan = "#00a599",
	blue = "#009ce1",
	magenta = "#d269e3",
}
local dark = {
	black = "#1c2f3f",
	gray = "#4e5c6a",
	white = "#a0adbb",
	red = "#ab214e",
	yellow = "#725600",
	green = "#2e6700",
	cyan = "#00665e",
	blue = "#00608c",
	magenta = "#9c08ad",
}

local lush = require("lush")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		ColorColumn({ bg = dark.red }), -- Columns set with 'colorcolumn'
		Conceal({ bg = normal.white }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ fg = normal.black }), -- Character under the cursor
		CurSearch({ fg = normal.black, bg = normal.yellow }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = normal.black }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = normal.black }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = normal.cyan }), -- Directory names (and other special names in listings)
		DiffAdd({ bg = dark.blue }), -- Diff mode: Added line |diff.txt|
		DiffChange({ bg = dark.magenta }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ fg = normal.blue, bg = dark.cyan }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ bg = dark.red }), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = normal.blue }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ bg = normal.magenta }), -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg({ fg = normal.white, bg = normal.red }), -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		Folded({ fg = normal.cyan, bg = dark.white }), -- Line used for closed folds
		FoldColumn({ fg = normal.cyan, bg = bright.black }), -- 'foldcolumn'
		SignColumn({ fg = normal.cyan, bg = bright.black }), -- Column where |signs| are displayed
		IncSearch({ fg = normal.black, bg = normal.magenta }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ fg = normal.black, bg = normal.yellow }), -- |:substitute| replacement text highlighting
		LineNr({ fg = normal.yellow }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = dark.yellow }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = dark.yellow }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ fg = bright.yellow }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ fg = normal.cyan, bg = bright.black }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ fg = normal.cyan, bg = bright.black }), -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ bg = bright.black }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		MsgSeparator({ fg = normal.black, bg = normal.magenta, gui = "bold" }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = normal.green }), -- |more-prompt|
		NonText({ fg = normal.blue }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- Normal         { }, -- Normal text
		NormalFloat({ bg = normal.black }), -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu({ bg = normal.black }), -- Popup menu: Normal item.
		PmenuSel({ bg = bright.black }), -- Popup menu: Selected item.
		PmenuKind({ bg = normal.black }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ bg = bright.black }), -- Popup menu: Selected item "kind"
		PmenuExtra({ bg = normal.black }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ bg = bright.black }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = bright.black }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = dark.white }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = normal.green }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ fg = normal.black, bg = normal.yellow }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ fg = normal.black, bg = normal.yellow }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ fg = normal.cyan }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ fg = normal.black, bg = normal.magenta, gui = "bold" }), -- Status line of current window
		StatusLineNC({ fg = normal.black, bg = normal.magenta }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({ bg = bright.black }), -- Tab pages line, not active tab page label
		TabLineFill({ fg = normal.black, bg = normal.magenta }), -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		Title({ fg = normal.magenta, gui = "bold" }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = dark.white }), -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = normal.red }), -- Warning messages
		Whitespace({ fg = normal.black }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ fg = normal.black, bg = normal.yellow }), -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = "#4e5c6a" }), -- Any comment

		Constant({ fg = normal.blue }), -- (*) Any constant
		String({ fg = normal.blue }), --   A string constant: "this is a string"
		Character({ fg = normal.blue }), --   A character constant: 'c', '\n'
		Number({ fg = normal.blue }), --   A number constant: 234, 0xff
		Boolean({ fg = normal.blue }), --   A boolean constant: TRUE, false
		Float({ fg = normal.blue }), --   A floating point constant: 2.3e10

		Identifier({ fg = normal.cyan }), -- (*) Any variable name
		Function({ fg = normal.cyan }), --   Function name (also: methods for classes)

		Statement({ fg = normal.cyan }), -- (*) Any statement
		Conditional({ fg = normal.cyan }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = normal.cyan }), --   for, do, while, etc.
		Label({ fg = normal.cyan }), --   case, default, etc.
		Operator({ fg = normal.cyan }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = normal.cyan }), --   any other keyword
		Exception({ fg = normal.cyan }), --   try, catch, throw

		PreProc({ fg = normal.magenta }), -- (*) Generic Preprocessor
		Include({ fg = normal.magenta }), --   Preprocessor #include
		Define({ fg = normal.magenta }), --   Preprocessor #define
		Macro({ fg = normal.magenta }), --   Same as Define
		PreCondit({ fg = normal.magenta }), --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = normal.green }), -- (*) int, long, char, etc.
		StorageClass({ fg = normal.green }), --   static, register, volatile, etc.
		Structure({ fg = normal.green }), --   struct, union, enum, etc.
		Typedef({ fg = normal.green }), --   A typedef

		Special({ fg = normal.red }), -- (*) Any special symbol
		SpecialChar({ fg = normal.red }), --   Special character in a constant
		Tag({ fg = normal.red }), --   You can use CTRL-] on this
		Delimiter({ fg = normal.red }), --   Character that needs attention
		SpecialComment({ fg = normal.red }), --   Special things inside a comment (e.g. '\n')
		Debug({ fg = normal.red }), --   Debugging statements

		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = normal.white, bg = normal.red }), -- Any erroneous construct
		Todo({ fg = normal.black, bg = normal.yellow }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = bright.red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = bright.yellow }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = bright.cyan }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = normal.white }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = bright.green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@variable"          { }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
