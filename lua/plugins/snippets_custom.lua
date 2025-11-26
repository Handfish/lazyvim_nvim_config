return {
  {
    "L3MON4D3/LuaSnip",
    -- This config function will run AFTER the default setup from the extra.
    -- We just need to add our custom snippets here.
    config = function()
      -- This is the only part we need.
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      ls.add_snippets("typescript", {
        s("gg", { t("function* (_) {"), t({ "", "\t" }), i(0), t({ "", "}" }) }),
        s("egg", { t("Effect.gen(function* (_) {"), t({ "", "\t" }), i(0), t({ "", "})" }) }),
        s("yy", { t("yield* _("), i(0), t(")") }),
        s("cyy", { t("const "), i(1), t(" = yield* _("), i(0), t(")") }),

        --Unity
				-- s("ustart", { t("void Start() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uupdate", { t("void Update() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uawake", { t("void Awake() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("ufixedupdate", { t("void FixedUpdate() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uonenable", { t("void OnEnable() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uondisable", { t("void OnDisable() {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uontriggerenter", { t("void OnTriggerEnter(Collider other) {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("uoncollisionenter", { t("void OnCollisionEnter(Collision collision) {"), t({"", "    "}), i(1), t({"", "}"}) }),
				-- s("userializefield", { t("[SerializeField] private "), i(1, "Type"), t(" "), i(2, "variableName"), t(";") }),
				-- s("upublicfield", { t("public "), i(1, "Type"), t(" "), i(2, "variableName"), t(";") }),
				-- s("ulog", { t('Debug.Log("'), i(1, "message"), t('");') }),
				-- s("uclass", {
				-- 	t("using UnityEngine;"), t({"", ""}),
				-- 	t("public class "), i(1, "ClassName"), t(" : MonoBehaviour"),
				-- 	t({"", "{"}),
				-- 	t({"", "    "}), i(2, "// Your code here"),
				-- 	t({"", "}"}),
				-- }),
      })
    end,
  },
}
