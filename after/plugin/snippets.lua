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
    s("cp", t({
        "#include <bits/stdc++.h>",
        "using namespace std;",
        "using ll = int64_t;",
        "",
        "void solve() {",
        "",
        "}",
        "",
        "int main() {",
        "    ios_base::sync_with_stdio(false);",
        "    cin.tie(0);",
        "    int t; cin >> t;",
        "    while (t--)",
        "        solve();",
        "}"
    })),
    s("fta", t({
        "map<ll, ll> fta(ll n) {",
        "   map<ll, ll> factors;",
        "", 
        "   while (n % 2 == 0) {",
        "       ++factors[2];",
        "       n /= 2;",
        "   }",
        "",
        "   for (int i = 3; i <= sqrt(n); i += 2) {",
        "       while (n % i == 0) {",
        "           ++factors[i];",
        "           n /= i;",
        "       }",
        "   }",
        "",
        "   if (n > 2)",
        "       ++factors[n];",
        "",
        "   return factors;",
        "}",
    })),
    s("nck", t({
        "ll mod_exp(ll base, ll exp, ll mod) {",
        "    ll result = 1;",
        "    while (exp > 0) {",
        "        if (exp % 2 == 1)",
        "            result = (result * base) % mod;",
        "        base = (base * base) % mod;",
        "        exp /= 2;",
        "    }",
        "    return result;",
        "}",
        "",
        "void compute_factorials(vector<int>& f, vector<in>& inv_f, int MAXN, int M) {",
        "    f[0] = 1;",
        "    for (int i = 1; i <= MAXN; ++i) {",
        "        f[i] = (f[i - 1] * i) % M;",
        "    }",
        "    inv_f[MAXN] = mod_exp(f[MAXN], M - 2, M);",
        "    for (int i = MAXN - 1; i >= 0; --i) {",
        "        inv_f[i] = (inv_f[i + 1] * (i + 1)) % M;",
        "    }",
        "}",
        "",
        "ll nck(ll n, ll k) {",
        "    if (k > n) return 0;",
        "    return (factorial[n] * inv_factorial[k] % M) * inv_factorial[n - k] % M;",
        "}",
    })),
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
    s("ri", {t("int "), i(1), t("; cin >> "), rep(1), t({";", ""})}),
    s("vi", t("vector<int>"));
    s("vll", t("vector<ll>"));
    s("vs", t("vector<string>"));
    s("si", t("set<int>"));
    s("sll", t("set<ll>"));
    s("ss", t("set<string>"));
    s("umi", t("unordered_map<int>"));
    s("umll", t("unordered_map<ll>"));
    s("ums", t("unordered_map<string>"));
    s("pi", t("pair<int, int>"));
	s("a_n", t({
        "vector<int> a(n);",
        "for (int i = 0; i < n; ++i)",
        "   cin >> a[i];",
        "",
    })),
	s("for", t({
        "for (int i = 0; i < n; ++i) {",
    })),
})
