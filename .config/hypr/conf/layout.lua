-----------------
---- LAYOUTS ----
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true
  },
  master = {
    -- xmonad like
    new_on_top = true
  },
})

hl.layout.register("grid", {
  recalculate = function(ctx)
    local n = #ctx.targets
    if n == 0 then
      return
    end

    local cols = math.ceil(math.sqrt(n))

    for i, target in ipairs(ctx.targets) do
      target:place(ctx:grid_cell(i, cols))
    end
  end,
})
