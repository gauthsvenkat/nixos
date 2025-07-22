# Memory Usage (`memory`)

## Description
Display RAM usage with color-coded status indicators

## Position
Right

## Documentation
[Memory Module](https://github.com/Alexays/Waybar/wiki/Module:-Memory)

## Configuration
- **Format**: `"󰍛 {percentage}%"` - memory icon with percentage
- **Color Coding**:
  - Green: 0-60% (normal usage)
  - Yellow: 61-85% (moderate usage)
  - Red: 86-100% (high usage)
- **Update Interval**: 2 seconds
- **Hover**: `"{used:0.1f}G / {total:0.1f}G ({percentage}%)"` - detailed memory breakdown
- **Click**: Launch `wezterm -e btop` (system monitor in terminal)
