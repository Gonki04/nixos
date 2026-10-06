require("vars")
require("style")
require("keybinds")
require("input_devices")
require("window_rules")

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = 1,
})

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
  hl.exec_cmd("systemctl --user start hyprland-session.target")
  hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland")
  hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
  hl.exec_cmd("systemctl --user start xdg-desktop-portal")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("swaybg -i ~/.background.jpg -m fill")
end)
