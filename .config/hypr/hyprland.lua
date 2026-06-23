require("conf.autostart")
require("conf.binds")
require("conf.layout")
require("conf.looks")
require("conf.rules")

------------------
---- MONITORS ----
hl.monitor({
  output   = "LVDS-1",
  mode     = "preferred",
  position = "0x0",
  scale    = "1",
})

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

---------------
---- INPUT ----
hl.config({
  input = {
    kb_layout    = "pl,us",
    kb_variant   = "colemak",
    kb_model     = "",
    kb_options   = "caps:backspace,grp:ctrls_toggle",
    kb_rules     = "",

    follow_mouse = 1, -- GOAT

    touchpad     = {
      tap_to_click = false,
      natural_scroll = false,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
-------------------------------
---- ENVIRONMENT VARIABLES ----
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_SIZE", "18")

hl.env("GTK_USE_PORTAL", "1")
-----------------------
----- PERMISSIONS -----
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
