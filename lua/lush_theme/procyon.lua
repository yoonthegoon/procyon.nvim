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

local mode = 'dark'
-- local flavor = 'purple'

local gray1  = "#000000"
local gray2  = "#35283d"
local gray3  = "#493b51"
local gray4  = "#514358"
local gray5  = "#64556b"
local gray6  = "#7f7087"
local gray7  = "#9e8ea6"
local gray8  = "#b6a6bf"
local gray9  = "#c1b0c9"
local gray10 = "#dccbe5"
local gray11 = "#fefcff"
local r1 = "#830042"
local o1 = "#7c1e00"
local y1 = "#4e3f00"
local g1 = "#004940"
local b1 = "#004370"
local p1 = "#5c2482"
local r2 = "#ac195c"
local o2 = "#a13615"
local y2 = "#6c5800"
local g2 = "#006659"
local b2 = "#005e99"
local p2 = "#7940a0"
local r3 = "#cd3f78"
local o3 = "#c2532f"
local y3 = "#8c7300"
local g3 = "#008574"
local b3 = "#007ac5"
local p3 = "#975cbe"
local r4 = "#f16196"
local o4 = "#e7724a"
local y4 = "#af911c"
local g4 = "#00a692"
local b4 = "#0099f5"
local p4 = "#b87adf"
local r5 = "#ff96b7"
local o5 = "#ff9c7a"
local y5 = "#d4b341"
local g5 = "#00ccb4"
local b5 = "#7fb9ff"
local p5 = "#da9eff"

local lc = gray6
local lr = r3
local lo = o3
local ly = y3
local lg = g3
local lb = b3
local lp = p3

local bg
local  f
local  n
local hc
local  t
local fg
local  r
local  o
local  y
local  g
local  b
local  p
local hr
local ho
local hy
local hg
local hb
local hp

if mode == "dark" then
  bg = gray2
  f  = gray4
  n  = gray7
  hc = gray9
  t  = gray10
  fg = gray11
  r  = r4
  o  = o4
  y  = y4
  g  = g4
  b  = b4
  p  = p4
  hr = r5
  ho = o5
  hy = y5
  hg = g5
  hb = b5
  hp = p5
elseif mode == "light" then
  bg = gray10
  f  = gray8
  n  = gray5
  hc = gray3
  t  = gray2
  fg = gray1
  r  = r2
  o  = o2
  y  = y2
  g  = g2
  b  = b2
  p  = p2
  hr = r1
  ho = o1
  hy = y1
  hg = g1
  hb = b1
  hp = p1
end

local lush = require('lush')
local hsl = lush.hsl

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    --
    -- See :h highlight-groups
    --
    ColorColumn      { bg = lr }, -- Columns set with 'colorcolumn'
    Conceal          { fg = fg, bg = n }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor           { }, -- Character under the cursor
    CurSearch        { fg = gray1, bg = hy }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor          { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM         { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn     { bg = f }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine       { bg = f }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory        { fg = hg }, -- Directory names (and other special names in listings)
    DiffAdd          { bg = lg }, -- Diff mode: Added line |diff.txt|
    DiffChange       { bg = lb }, -- Diff mode: Changed line |diff.txt|
    DiffDelete       { gui = "bold", fg = r, bg = f }, -- Diff mode: Deleted line |diff.txt|
    DiffText         { gui = "bold", bg = r }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer      { gui = "bold", fg = b}, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor       { }, -- Cursor in a focused terminal
    -- TermCursorNC     { }, -- Cursor in an unfocused terminal
    ErrorMsg         { fg = gray11, bg = r }, -- Error messages on the command line
    -- VertSplit        { }, -- Column separating vertically split windows
    Folded           { fg = g, bg = n }, -- Line used for closed folds
    FoldColumn       { fg = hg, bg = f }, -- 'foldcolumn'
    SignColumn       { fg = hg, bg = f }, -- Column where |signs| are displayed
    -- IncSearch        { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute       { fg = gray1, bg = y }, -- |:substitute| replacement text highlighting
    LineNr           { fg = y }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove      { fg = ly }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow      { fg = ly }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr     { gui = "bold", fg = hy }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold   { fg = hg, bg = f }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign   { fg = hg, bg = f }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen       { bg = hc }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg          { gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea          { }, -- Area for messages and cmdline
    -- MsgSeparator     { gui = "bold" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg          { gui = "bold", fg = g }, -- |more-prompt|
    NonText          { gui = "bold", fg = b }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal           { fg = fg, bg = bg }, -- Normal text
    NormalFloat      { bg = f }, -- Normal text in floating windows.
    -- NotifyBackground { bg = f },
    -- FloatBorder      { }, -- Border of floating windows.
    FloatTitle       { gui = "bold", fg = p }, -- Title of floating windows.
    NormalNC         { fg = t }, -- normal text in non-current windows
    Pmenu            { bg = f }, -- Popup menu: Normal item.
    PmenuSel         { bg = n }, -- Popup menu: Selected item.
    PmenuKind        { bg = f }, -- Popup menu: Normal item "kind"
    PmenuKindSel     { bg = n }, -- Popup menu: Selected item "kind"
    PmenuExtra       { bg = f }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel    { bg = n }, -- Popup menu: Selected item "extra text"
    PmenuSbar        { bg = f }, -- Popup menu: Scrollbar.
    PmenuThumb       { bg = hc }, -- Popup menu: Thumb of the scrollbar.
    Question         { gui = "bold", fg = g }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine     { fg = gray1, bg = y }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search           { fg = gray1, bg = ly }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey       { fg = hg }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad         { gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap         { gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal       { gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare        { gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine       { gui = "bold", bg = f }, -- Status line of current window
    StatusLineNC     { bg = f }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine          { }, -- Tab pages line, not active tab page label
    -- TabLineFill      { }, -- Tab pages line, where there are no labels
    TabLineSel       { gui = "bold" }, -- Tab pages line, active tab page label
    Title            { gui = "bold", fg = p }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual           { bg = f }, -- Visual mode selection
    -- VisualNOS        { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg       { fg = r}, -- Warning messages
    Whitespace       { gui = "bold", fg = n }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator     { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu         { fg = gray1, bg = y }, -- Current match in 'wildmenu' completion
    WinBar           { gui = "bold" }, -- Window bar of current window
    WinBarNC         { gui = "bold" }, -- Window bar of not-current windows

    --
    -- See :h group-name
    --

    Comment        { gui = "italic", fg = lc }, -- Any comment

    Constant       { fg = fg }, -- (*) Any constant
    String         { fg = hr }, --   A string constant: "this is a string"
    Character      { fg = hr }, --   A character constant: 'c', '\n'
    Number         { fg = r }, --   A number constant: 234, 0xff
    Boolean        { fg = r }, --   A boolean constant: TRUE, false
    Float          { fg = r }, --   A floating point constant: 2.3e10

    Identifier     { gui = "italic", fg = fg }, -- (*) Any variable name
    Function       { fg = hg }, --   Function name (also: methods for classes)

    Statement      { gui = "bold", fg = hy }, -- (*) Any statement
    Conditional    { gui = "bold", fg = hy }, --   if, then, else, endif, switch, etc.
    Repeat         { gui = "bold", fg = hy }, --   for, do, while, etc.
    Label          { gui = "bold", fg = hy }, --   case, default, etc.
    Operator       { gui = "bold", fg = hy }, --   "sizeof", "+", "*", etc.
    Keyword        { gui = "bold", fg = hy }, --   any other keyword
    Exception      { gui = "bold", fg = hy }, --   try, catch, throw

    PreProc        { fg = p }, -- (*) Generic Preprocessor
    Include        { fg = lp }, --   Preprocessor #include
    Define         { fg = lp }, --   Preprocessor #define
    Macro          { fg = p }, --   Same as Define
    PreCondit      { fg = p }, --   Preprocessor #if, #else, #endif, etc.

    Type           { gui = "bold", fg = g }, -- (*) int, long, char, etc.
    StorageClass   { gui = "bold", fg = g }, --   static, register, volatile, etc.
    Structure      { gui = "bold", fg = g }, --   struct, union, enum, etc.
    Typedef        { gui = "bold", fg = g }, --   A typedef

    Special        { fg = lo }, -- (*) Any special symbol
    SpecialChar    { fg = o }, --   Special character in a constant
    Tag            { fg = o }, --   You can use CTRL-] on this
    Delimiter      { fg = lo }, --   Character that needs attention
    SpecialComment { fg = ho }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = o }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = gray11, bg = r }, -- Any erroneous construct
    Todo           { fg = gray1, bg = y }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

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
    DiagnosticError            { fg = r } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = y} , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = hb } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = hp } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg = g } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
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

return theme

