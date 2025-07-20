# Task 3: Implement Waybar

**Description:**
Create a functional and customizable Waybar configuration for Hyprland.

**Suggestions:**
- `waybar`

**Functional Requirements:**
- Display workspaces (`hyprland/workspaces`)
- Show system tray (`tray`)
- Show essential hardware info (`cpu`, `memory`)
- Control volume (`wireplumber`) and backlight (`backlight`)
- Show network status (`network`)
- Show clock (`clock`)

**Nice-to-haves:**
- Start button to launch application launcher
- Media player controls (`mpris`)
- Custom VPN status module
- Interactive modules:
  - Click `wireplumber` to open `pavucontrol`
  - Click `network` to open network manager GUI
  - Click `clock` to show calendar

**Architecture:**
- Waybar modules defined in separate files
- Composition at `bases` layer for per-host configuration
- Conditional inclusion of modules (e.g., battery/backlight only on laptops)
