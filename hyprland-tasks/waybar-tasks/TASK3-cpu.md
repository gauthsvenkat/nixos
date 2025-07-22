# CPU Usage (`cpu`)

## Description
Display CPU usage with color-coded status indicators

## Position
Right

## Documentation
[CPU Module](https://github.com/Alexays/Waybar/wiki/Module:-CPU)

## Configuration
- **Format**: `"󰻠 {usage}%"` - processor icon with percentage
- **Color Coding**:
  - Green: 0-50% (normal usage)
  - Yellow: 51-80% (moderate usage)
  - Red: 81-100% (high usage)
- **Update Interval**: 2 seconds
- **Hover**: Detailed per-core breakdown with individual percentages
- **Click**: Launch `wezterm -e btop` (system monitor in terminal)
