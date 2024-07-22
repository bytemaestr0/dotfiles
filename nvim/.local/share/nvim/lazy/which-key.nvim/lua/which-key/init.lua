---@class wk
---@field private _queue {spec: wk.Spec, opts?: wk.Parse}[]
local M = {}

M._queue = {}

local timer = (vim.uv or vim.loop).new_timer()
timer:start(
  500,
  0,
  vim.schedule_wrap(function()
    M.setup()
  end)
)

--- Open which-key
---@param opts? wk.Filter|string
function M.show(opts)
  opts = opts or {}
  opts = type(opts) == "string" and { keys = opts } or opts
  opts.delay = 0
  ---@diagnostic disable-next-line: param-type-mismatch
  if not require("which-key.state").start(opts) then
    require("which-key.util").warn(
      "No mappings found for mode `" .. (opts.mode or "n") .. "` and keys `" .. (opts.keys or "") .. "`"
    )
  end
end

---@param opts? wk.Opts
function M.setup(opts)
  timer:stop()
  require("which-key.config").setup(opts)
end

-- Use `require("which-key").add()` instead.
-- The spec is different though, so check the docs!
---@deprecated
---@param mappings wk.Spec
---@param opts? wk.Mapping
function M.register(mappings, opts)
  if opts then
    for k, v in pairs(opts) do
      mappings[k] = v
    end
  end
  M.add(mappings, { version = 1 })
end

--- Add mappings to which-key
---@param mappings wk.Spec
---@param opts? wk.Parse
function M.add(mappings, opts)
  table.insert(M._queue, { spec = mappings, opts = opts })
end

return M
