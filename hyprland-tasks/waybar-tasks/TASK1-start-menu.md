# Start Menu (`group/start-menu`)

## Description
NixOS-themed start menu with frequently used applications drawer

## Position
Left

## Documentation
[Group Module](https://github.com/Alexays/Waybar/wiki/Module:-Group)

## Configuration
- **Group Leader**: NixOS logo (󱄅) - launches tofi on click
- **Drawer Children**:
  - wezterm (󰆍) - terminal
  - dolphin (󰝰) - file manager
  - firefox (󰈹) - web browser
  - spotify (󰓇) - music streaming
  - jellyfin (󰚺) - media server
  - steam (󰓓) - gaming platform
- **Hover**: Reveals drawer with application shortcuts
- **Click**: NixOS icon → tofi launcher, app icons → launch respective apps
- **Drawer Config**:
  - Transition duration: 300ms
  - Left-to-right transition
  - Hover to reveal (not click)
