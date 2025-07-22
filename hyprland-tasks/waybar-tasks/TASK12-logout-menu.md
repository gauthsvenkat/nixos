# Logout Menu (`group/logout-menu`)

## Description
Power options menu with quick access actions and full wlogout integration

## Position
Right

## Documentation
[Group Module](https://github.com/Alexays/Waybar/wiki/Module:-Group)

## Configuration
- **Group Leader**: Power/logout icon (󰐥) - launches full wlogout interface
- **Drawer Children**:
  - **Lock Screen** (󰍁) - `hyprlock` or configured lock command
  - **Sleep/Suspend** (󰤄) - `systemctl suspend`
  - **Shutdown** (󰐥) - `systemctl poweroff`
- **Format**: Icons only for clean appearance
- **Hover**: Reveals drawer with quick power actions
- **Click Actions**:
  - **Power Icon**: Launch `wlogout` (comprehensive power menu with all options)
  - **Lock Icon**: Execute screen lock command
  - **Sleep Icon**: Suspend system to RAM
  - **Shutdown Icon**: Power off system
- **Drawer Configuration**:
  - **Transition Duration**: 300ms (smooth reveal)
  - **Direction**: Left-to-right transition
  - **Trigger**: Hover to reveal (not click)
  - **Auto-hide**: Drawer closes when mouse leaves area
