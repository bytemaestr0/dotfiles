---@type table<string, wk.Opts>
return {
  helix = {
    win = {
      width = { min = 30, max = 60 },
      height = { min = 4, max = 0.5 },
      col = -1,
      row = -1,
      border = "rounded",
      title = true,
      title_pos = "left",
    },
  },
  modern = {
    win = {
      width = 0.9,
      height = { min = 4, max = 25 },
      col = 0.5,
      row = -1,
      border = "rounded",
      title = true,
      title_pos = "center",
    },
  },
  classic = {
    win = {
      width = math.huge,
      height = { min = 4, max = 25 },
      col = 0,
      row = -1,
      border = "none",
      title = false,
    },
  },
}
