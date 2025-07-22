# Disk Usage (`disk`)

## Description
Display root partition usage with color-coded status indicators

## Position
Right

## Documentation
[Disk Module](https://github.com/Alexays/Waybar/wiki/Module:-Disk)

## Configuration
- **Format**: `"󰋊 {percentage_used}%"` - storage icon with percentage
- **Path**: "/" (root partition)
- **Color Coding**:
  - Green: 0-70% (normal usage)
  - Yellow: 71-90% (moderate usage)
  - Red: 91-100% (high usage)
- **Update Interval**: 30 seconds (slower since disk usage changes less frequently)
- **Hover**: `"{used} / {total} ({percentage_used}%)"` - detailed storage breakdown
- **Click**: Launch `wezterm -e btop` (system monitor in terminal)
