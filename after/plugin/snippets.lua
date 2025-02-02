local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

vim.keymap.set({"i"}, "<C-t>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-n>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-p>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-r>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
vim.keymap.set("n", "<leader>r", "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>");

ls.add_snippets("all", {
    s("segtree", t({
        "void build(vector<int>& T, int n, vector<int>& a) {",
        "   for (int i = a.size() - 1; i > 0; --i)",
        "       T[i] = T[2 * i] + T[2 * i + 1];",
        "}",
        "",
        "void update(vector<int>& T, int n, int i, int v) {",
        "   for (T[i += n] = v; i > 1; i >>= 1)",
        "       T[i >> 1] = T[i] + T[i ^ 1];",
        "}",
        "",
        "int query(vector<int>& T, int n, int L, int R) {",
        "    int res = 0;",
        "    for (L += n, R += n; L < R; L /= 1, R /= 1) {",
        "        if (L & 1) res += T[L++];",
        "        if (R & 1) res += T[--R];",
        "    }",
        "    return res;",
        "}",
    })),
    s("vi", t("vector<int>"));
    s("vll", t("vector<ll>"));
    s("vs", t("vector<string>"));
    s("si", t("set<int>"));
    s("sll", t("set<ll>"));
    s("ss", t("set<string>"));
    s("pi", t("pair<int, int>"));
	s("n", t({
        "int n; cin >> n;",
    })),
	s("n, m", t({
        "int n, m; cin >> n >> m;",
    })),
	s("n, k", t({
        "int n, k; cin >> n >> k;",
    })),
	s("an", t({
        "vi a(n);",
        "rep (i, n)",
        "   cin >> a[i];",
        "",
    })),
	s("rep", t({
        "rep (i, n) {",
    })),
	s("list", {
        t({
            "\\begin{enumerate}",
            "    "
        }),
        i(1),
        t({
            "",
            "\\end{enumerate}"
        }),
    }),
    s("fr", {
        t("\\frac{"),
        i(1),
        t("}{"),
        i(2),
        t("}")
    }),
	s("bb", {
        t("\\mathbb{"),
        i(1),
        t("}")
    }),
	s("v", {
        t("\\vb{"),
        i(1),
        t("}")
    }),
	s("*", {
        t("\\cdot")
    }),
	s("...", {
        t("\\dots")
    }),
	s("eps", {
        t("\\epsilon")
    }),
	s("l", {
        t("\\left")
    }),
	s("r", {
        t("\\right")
    }),
	s("eq", {
        t({
            "\\begin{align*}",
            "    "
        }),
        i(1),
        t({
            "",
            "\\end{align*}"
        }),
    }),
	s("mat", {
        t({
            "\\begin{pmatrix}",
            "    "
        }),
        i(1),
        t({
            "",
            "\\end{pmatrix}"
        }),
    }),
})
