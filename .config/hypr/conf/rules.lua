--------------------
---- WORKSPACES ----
--- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--   name        = "no-gaps-wtv1",
--   match       = { float = false, workspace = "w[tv1]" },
--   border_size = 0,
--   rounding    = 0,
-- })
-- hl.window_rule({
--   name        = "no-gaps-f1",
--   match       = { float = false, workspace = "f[1]" },
--   border_size = 0,
--   rounding    = 0,
-- })

-- master for workspace 1 and bsp for others
hl.workspace_rule({ workspace = "1", layout = "master" })
hl.workspace_rule({ workspace = "9", layout = "lua:grid" })

-- auto spawn foot for scratchpad
hl.workspace_rule({
  workspace = "special:magic",
  -- float = true,
  on_created_empty = "foot",
  gaps_out = 120
})

-- auto spawn foot for scratchpad
hl.workspace_rule({
  workspace = "special:overlay",
  -- float = true,
  gaps_out = 50
})

hl.window_rule({ match = { class = "KeePassXC" }, workspace = "special:overlay" })

-----------------
---- WINDOWS ----
--- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
hl.window_rule({ match = { class = "brave-browser" }, workspace = "1 silent" })

-- dim with the dim tag (SUPER+D)
hl.window_rule({ opacity = 0.6, match = { tag = "dimmer" } })

-- Fullscreen inhibit idle
hl.window_rule({ idle_inhibit = "fullscreen", match = { class = "*" } })

-- Fix pinentry losing focus
hl.window_rule({ stay_focused = true, match = { class = "(pinentry-)(.*)" }, })

-- Popup follow
hl.window_rule({ pin = true, match = { class = "^dragon-drop" } })

-- Always float
hl.window_rule({
  float = true,
  match = {
    class = "^dragon-drop|^io.ente.auth|xdg-desktop-portal.*",
  }
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  no_focus = true,
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
