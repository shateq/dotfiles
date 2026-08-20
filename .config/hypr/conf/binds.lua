local mainMod     = "SUPER"
---------------------
---- MY PROGRAMS ----
local terminal    = "kitty"
local fileManager = "foot yazi"
local calendar    = "foot ikhal"

local locker      = "hyprlock"
local menu = "fuzzel"
-- local menu        = "tofi-drun | xargs -I {} hyprctl dispatch 'hl.dsp.exec_cmd(\"{}\")'"
local calc        = "speedcrunch"
---------------------
------ HELPERS ------
local bindel      = function(key, cmd)
  hl.bind(key, hl.dsp.exec_cmd(cmd), { locked = true, repeating = true })
end

local binde       = function(key, cmd)
  hl.bind(key, hl.dsp.exec_cmd(cmd), { locked = true })
end

local bindl       = function(key, dsp)
  hl.bind(key, dsp, { repeating = true })
end

local map_exec    = function(key, cmd)
  hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd(cmd))
end
---------------------
---- KEYBINDINGS ----
map_exec("Return", terminal)
map_exec("Space", menu)
map_exec("A", "$BROWSER")
map_exec("B", calendar)
map_exec("E", fileManager)
map_exec("ALT + Q", locker)
map_exec("ALT + B", "killall -SIGUSR1 waybar")
-- hl.bind(mainMod .. " + R", function() hl.dispatch(hl.dsp.workspace.rename({ workspace = "+0", name = name })) end)

-- universa/ Clipboard
map_exec("ALT + V", "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy")
hl.bind(mainMod .. " + CTRL + ALT +  V", function()
  hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert" })
  hl.notification.create({ text = "Wiped clipboard history", timeout = 2000, font_size = 16 })
end)
hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert" }))
hl.bind(mainMod .. " + V", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert" }))
-- hl.bind(mainMod .. " + X", hl.dsp.send_shortcut({ mods = "CTRL", key = "X" }))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + BackSpace",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
-- xmonad fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.window.tag({ tag = "dimmer" }))

-- Alt TAB
hl.bind("ALT + Tab", hl.dsp.exec_cmd("rofi -show window"));
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ last = true }));
-- banger
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ workspace = "previous" }));

--------------
--- Layout ---
-- hl.bind(mainMod .. " + SHIFT + T", function() hl.config({ general = { layout = "dwindle" } }) end)
-- hl.bind(mainMod .. " + G", function() hl.config({ general = { layout = "grid" } }) end)
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + G", function()
  local layout = hl.get_active_workspace().tiled_layout
  if layout == "master" then
    hl.dispatch(hl.dsp.layout("rollnext"))
  elseif layout == "dwindle" then
    hl.dispatch(hl.dsp.layout("togglesplit"))
  end
end)

hl.bind(mainMod .. " + SHIFT + G", function()
  local layout = hl.get_active_workspace().tiled_layout
  if layout == "master" then
    hl.dispatch(hl.dsp.layout("rollprev"))
  elseif layout == "dwindle" then
    hl.dispatch(hl.dsp.window.cycle_next({ next = false, tiled = true }))
  end
end)

-- dwindle/master Return
hl.bind(mainMod .. " + SHIFT + Return", function()
  local layout = hl.get_active_workspace().tiled_layout
  if layout == "master" then
    hl.dispatch(hl.dsp.layout("swapwithmaster master"))
  elseif layout == "dwindle" then
    hl.dispatch(hl.dsp.layout("movetoroot"))
  end
end)

bindl(mainMod .. " + Minus", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
bindl(mainMod .. " + Equal", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
bindl(mainMod .. " + SHIFT + Minus", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
bindl(mainMod .. " + SHIFT + Equal", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

-- Move focus with mainMod + arrow keys
local focus = {
  left = "left",
  h = "left",
  right = "right",
  l = "right",
  up = "up",
  k = "up",
  down = "down",
  j = "down",
}
for key, value in pairs(focus) do
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = value }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = value }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
  hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

--- MONITORS
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ monitor = "l" }))

-- not work
hl.bind(mainMod .. " + CTRL + SHIFT + X", hl.dsp.workspace.swap_monitors({ monitor1 = "r", monitor2 = "l" }));

-- (scratchpad)
hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))
-- (overlay)
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("overlay"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + P", hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
--------------
--- Extras ---
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
-- laptop specific
hl.bind("Scroll_Lock", hl.dsp.exec_cmd(locker))
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd(menu))
hl.bind("XF86Calculator", hl.dsp.exec_cmd(calc))

-- Laptop multimedia keys for volume and LCD brightness
bindel("XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
bindel("XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
bindel("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
bindel("XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
bindel("XF86MonBrightnessUp", "brightnessctl -e4 -n2 set 10%+")
bindel("XF86MonBrightnessDown", "brightnessctl -e4 -n2 set 10%-")

binde("XF86AudioNext", "playerctl next")
binde("XF86AudioPause", "playerctl play-pause")
binde("XF86AudioPlay", "playerctl play-pause")
binde("XF86AudioPrev", "playerctl previous")

-- Disable all keybinds
-- bind = $mod, Escape, submap, clean
-- submap = clean
-- bind = $mod, Escape, submap, reset
-- submap = reset

-- DICTATION subfeature
-- local startDict = "nerd-dictation begin --simulate-input-tool WTYPE"
-- local polDict   = "nerd-dictation begin --simulate-input-tool WTYPE --vosk-model-dir=$HOME/.config/nerd-dictation/polish"
-- local stopDict  = "nerd-dictation end"
--
-- hl.bind(mainMod .. " + S", hl.dsp.submap("dictation"))
-- map_exec(" + S", startDict)
-- hl.bind(mainMod .. " + ALT + S", hl.dsp.submap("dictation"))
-- map_exec("ALT + S", polDict)
--
-- hl.define_submap("dictation", "reset", function()
--   hl.bind("catchall", hl.dsp.exec_cmd(stopDict))
-- end)
