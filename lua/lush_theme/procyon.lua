--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local normal = {
	-- black = "#2c3d4c",
	-- gray = "#6a7785",
	-- white = "#b2bfcd",
  black = "#46354a",
  gray = "#807083",
  white = "#c8b9cb",
	red = "#ca466a",
	yellow = "#937000",
	green = "#3e8500",
	cyan = "#00847a",
	blue = "#007db5",
	magenta = "#b544c6",
}
local bright = {
	-- black = "#3b4958",
	-- gray = "#8895a3",
	-- white = "#c6d2e1",
  black = "#534256",
  gray = "#9e8fa1",
  white = "#dbccdf",
	red = "#ec6788",
	yellow = "#b88d00",
	green = "#4fa700",
	cyan = "#00a599",
	blue = "#009ce1",
	magenta = "#d269e3",
}
local dark = {
	-- black = "#1c2f3f",
	-- gray = "#4e5c6a",
	-- white = "#a0adbb",
	black = "#3a263d",
  gray = "#655568",
  white = "#b6a6b9",
  red = "#ab214e",
	yellow = "#725600",
	green = "#2e6700",
	cyan = "#00665e",
	blue = "#00608c",
	magenta = "#9c08ad",
}
local bg = dark.black
local b1 = normal.black
local b2 = bright.black
local b3 = dark.gray
local fg = bright.white
local f1 = normal.white
local f2 = dark.white
local f3 = bright.gray

-- TODO: add check for dark/light mode
-- TODO: add check for flavor

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    NotifyBackground {bg = b1},
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
    ColorColumn    {bg = dark.red }, -- Columns set with 'colorcolumn'
    Conceal        {bg = normal.gray }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         {bg = fg }, -- Character under the cursor
    CurSearch      {fg = bg, bg = normal.yellow }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   {bg = b1 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     {bg = b1 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      {fg = normal.cyan }, -- Directory names (and other special names in listings)
    DiffAdd        {bg = dark.blue }, -- Diff mode: Added line |diff.txt|
    DiffChange     {bg = dark.magenta }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     {fg = normal.blue, bg = dark.cyan, gui = "bold" }, -- Diff mode: Deleted line |diff.txt|
    DiffText       {bg = dark.red, gui = "bold" }, -- Diff mode: Changed text within a changed line |diff.txt|
    IncSearch      {bg = b3 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     {fg = bg, bg = normal.yellow }, -- |:substitute| replacement text highlighting
    LineNr         {fg = normal.yellow }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    {fg = dark.yellow }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    {fg = dark.yellow }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   {fg = bright.yellow, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold {fg = normal.cyan, bg = b2}, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign {fg = normal.cyan, bg = b2 }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     {bg = fg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        {gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    MsgSeparator   {bg = b3, gui = "bold" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        {fg = normal.green, gui = "bold" }, -- |more-prompt|
    NonText        {fg = normal.blue, gui = "bold" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         {fg = fg, bg = bg }, -- Normal text
    NormalFloat    {bg = b1 }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    FloatTitle     {fg = normal.magenta, gui = "bold" }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          {bg = b1 }, -- Popup menu: Normal item.
    PmenuSel       {bg = normal.gray }, -- Popup menu: Selected item.
    PmenuKind      {bg = b1 }, -- Popup menu: Normal item "kind"
    PmenuKindSel   {bg = normal.gray }, -- Popup menu: Selected item "kind"
    PmenuExtra     {bg = b1 }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  {bg = normal.gray }, -- Popup menu: Selected item "extra text"
    PmenuSbar      {bg = b2 }, -- Popup menu: Scrollbar.
    PmenuThumb     {bg = fg }, -- Popup menu: Thumb of the scrollbar.
    Question       {fg = normal.green, gui = "bold" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   {fg = bg, bg = normal.yellow }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         {fg = bg, bg = normal.yellow }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     {fg = normal.cyan }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       {gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       {gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     {gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      {gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     {bg = b3, gui = "bold" }, -- Status line of current window
    StatusLineNC   {bg = b3, gui = "bold" }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        {bg = normal.gray }, -- Tab pages line, not active tab page label
    TabLineFill    {bg = b3 }, -- Tab pages line, where there are no labels
    TabLineSel     {gui = "bold" }, -- Tab pages line, active tab page label
    Title          {fg = normal.magenta, gui = "bold" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         {fg = bg, bg = normal.gray }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     {fg = normal.red }, -- Warning messages
    Whitespace     {fg = b2, gui = "bold" }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       {fg = bg, bg = normal.yellow }, -- Current match in 'wildmenu' completion
    WinBar         {gui = "bold" }, -- Window bar of current window
    WinBarNC       {gui = "bold" }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        {fg = b3 }, -- Any comment

    Constant       {fg = normal.red, gui = "italic" }, -- (*) Any constant
    String         {fg = normal.red }, --   A string constant: "this is a string"
    Character      {fg = normal.red }, --   A character constant: 'c', '\n'
    Number         {fg = normal.red }, --   A number constant: 234, 0xff
    Boolean        {fg = normal.red }, --   A boolean constant: TRUE, false
    Float          {fg = normal.red }, --   A floating point constant: 2.3e10

    Identifier     {fg = normal.cyan, gui = "italic" }, -- (*) Any variable name
    Function       {fg = normal.cyan }, --   Function name (also: methods for classes)

    Statement      {fg = normal.yellow }, -- (*) Any statement
    Conditional    {fg = normal.yellow }, --   if, then, else, endif, switch, etc.
    Repeat         {fg = normal.yellow }, --   for, do, while, etc.
    Label          {fg = normal.yellow }, --   case, default, etc.
    Operator       {fg = normal.yellow }, --   "sizeof", "+", "*", etc.
    Keyword        {fg = normal.yellow }, --   any other keyword
    Exception      {fg = normal.yellow }, --   try, catch, throw

    PreProc        {fg = normal.magenta }, -- (*) Generic Preprocessor
    Include        {fg = normal.magenta }, --   Preprocessor #include
    Define         {fg = normal.magenta }, --   Preprocessor #define
    Macro          {fg = normal.magenta }, --   Same as Define
    PreCondit      {fg = normal.magenta }, --   Preprocessor #if, #else, #endif, etc.

    Type           {fg = normal.green }, -- (*) int, long, char, etc.
    StorageClass   {fg = normal.green, gui = "italic" }, --   static, register, volatile, etc.
    Structure      {fg = normal.green, gui = "italic" }, --   struct, union, enum, etc.
    Typedef        {fg = normal.green, gui = "italic" }, --   A typedef

    Special        {fg = normal.blue }, -- (*) Any special symbol
    SpecialChar    {fg = normal.blue }, --   Special character in a constant
    Tag            {fg = normal.blue }, --   You can use CTRL-] on this
    Delimiter      {fg = normal.blue }, --   Character that needs attention
    SpecialComment {fg = normal.blue }, --   Special things inside a comment (e.g. '\n')
    Debug          {fg = normal.blue }, --   Debugging statements

    Underlined     {gui = "underline" }, -- Text that stands out, HTML links
    Ignore         {fg = normal.gray }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          {fg = fg, bg = normal.red }, -- Any erroneous construct
    Todo           {fg = bg, bg = normal.yellow }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
    DiagnosticError            {fg = bright.red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             {fg = bright.yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             {fg = bright.cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             {fg = f1 } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               {fg = bright.green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
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
