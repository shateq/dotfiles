-------------------
---- AUTOSTART ----
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar & mako &")
  hl.exec_cmd("hypridle &")
  hl.exec_cmd("swaybg -i ~/Pictures/Bg/macos_seqoia.jpg &")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("kdeconnectd & kdeconnect-indicator &")
end)
