local function foo(t)
  local keys = {}
  for k, v in pairs(t) do
    keys[#keys+1] = k
  end
  for _, k in ipairs(keys) do
    if type(t[k]) == "table" then
      foo(t[k])
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t)

-- Explanation:
-- The original code uses pairs directly leading to issues if the table is modified during iteration.
-- The solution creates a copy of the keys before iterating, ensuring that modifications within the nested function calls don't affect the iteration process.